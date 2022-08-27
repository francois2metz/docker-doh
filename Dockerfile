FROM rust as builder

RUN cargo install doh-proxy

FROM debian:buster

COPY --from=builder /usr/local/cargo/bin/doh-proxy /usr/local/bin/doh-proxy

EXPOSE 3000
ENTRYPOINT ["doh-proxy", "--listen-address", "0.0.0.0:3000"]
