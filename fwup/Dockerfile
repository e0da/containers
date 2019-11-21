FROM alpine
# Using a build script takes the image size from 366MB to 24MB. (My docker is
# too old to build --squash.)
COPY build.sh /
RUN sh build.sh
ENTRYPOINT [ "fwup" ]
