FROM golang:1.21.1-alpine AS builder
WORKDIR /usr/src/app
COPY src/* .
RUN go build

FROM scratch
COPY --from=builder /usr/src/app/hello /usr/src/app/hello
ENTRYPOINT ["/usr/src/app/hello"]
