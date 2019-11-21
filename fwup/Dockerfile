FROM alpine

# https://github.com/sgerrand/alpine-pkg-glibc
RUN apk --no-cache add ca-certificates wget
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.30-r0/glibc-2.30-r0.apk
RUN apk add glibc-2.30-r0.apk
RUN rm glibc-2.30-r0.apk

# https://github.com/fhunleth/fwup/blob/master/docs/build_linux.md
RUN apk --no-cache add autoconf automake bash curl g++ git libarchive-dev \
  libsodium-dev libtool linux-headers make pkgconf
RUN curl -L https://github.com/martinh/libconfuse/releases/download/v3.0/confuse-3.0.tar.gz | \
  tar -xz -C /tmp
WORKDIR /tmp/confuse-3.0
RUN ./configure
RUN make
RUN make install
RUN rm -rf /tmp/confuse-3.0
RUN git clone https://github.com/fhunleth/fwup /tmp/fwup
WORKDIR /tmp/fwup
RUN bash ./scripts/download_deps.sh
RUN bash ./scripts/build_deps.sh
RUN bash ./autogen.sh
RUN PKG_CONFIG_PATH=/home/fhunleth/fwup/build/host/deps/usr/lib/pkgconfig \
  ./configure --enable-shared=no
RUN make
RUN make install
RUN rm -rf /tmp/fwup

# Clean up build dependencies
# RUN apk --no-cache del autoconf automake bash ca-certificates curl g++ git \
#   glibc libtool linux-headers make pkgconf wget

WORKDIR /root
ENTRYPOINT [ "fwup" ]
