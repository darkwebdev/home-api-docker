FROM tibalt/alpine-node

WORKDIR /app

USER app

RUN \
git clone --depth=1 https://github.com/darkwebdev/home-api && \
cd home-api && \
npm i

COPY app /app

EXPOSE 8080

ENTRYPOINT ["/app/entry.sh"]
