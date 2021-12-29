FROM ghcr.io/nurodev/vercel-ddns:latest

ADD entrypoint.sh /app/

RUN chmod +x /app/entrypoint.sh

WORKDIR /app/

ENTRYPOINT ["sh", "/app/entrypoint.sh"]

CMD [""]
