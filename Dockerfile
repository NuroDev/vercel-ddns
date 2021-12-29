# ==============================================================================

FROM --platform=$TARGETPLATFORM ekidd/rust-musl-builder:latest as builder

ADD --chown=rust:rust . ./

RUN cargo build --release

# ==============================================================================

FROM alpine:latest

LABEL com.github.actions.color="black" \
      com.github.actions.description="Dynamic DNS for Vercel" \
      com.github.actions.icon="hard-drive" \
      maintainer="nurodev" \
      com.github.actions.name="vercel-ddns" \
      org.opencontainers.image.authors="nurodev" \
      org.opencontainers.image.description="Dynamic DNS for Vercel" \
      org.opencontainers.image.documentation="https://github.com/nurodev/vercel-ddns" \
      org.opencontainers.image.source="https://github.com/nurodev/vercel-ddns" \
      org.opencontainers.image.url="https://github.com/nurodev/vercel-ddns" \
      org.opencontainers.image.vendor="vercel-ddns"

RUN apk --no-cache add ca-certificates

COPY --from=builder /home/rust/src/target/x86_64-unknown-linux-musl/release/vercel-ddns /usr/local/bin/vercel-ddns

CMD [ "vercel-ddns" ]

# ==============================================================================
