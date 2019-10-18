FROM golang
RUN go get github.com/cortesi/devd/cmd/devd
ENTRYPOINT [ "devd", "--port=80", "--address=0.0.0.0" ]
