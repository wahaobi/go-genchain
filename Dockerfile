# Build Ggen in a stock Go builder container
FROM golang:1.10-alpine as builder

RUN apk add --no-cache make gcc musl-dev linux-headers

ADD . /go-genchain
RUN cd /go-genchain && make ggen

# Pull Ggen into a second stage deploy alpine container
FROM alpine:latest

RUN apk add --no-cache ca-certificates
COPY --from=builder /go-genchain/build/bin/ggen /usr/local/bin/

EXPOSE 17090 8546 60606 60606/udp
ENTRYPOINT ["ggen"]