FROM tibalt/alpine-node

RUN \
apk add --no-cache make gcc g++ python linux-headers udev && \
npm i serialport --build-from-source

WORKDIR /app

USER app

ADD https://api.github.com/repos/darkwebdev/home-api/git/refs/heads/master version.json

RUN \
git clone --depth=1 -b master https://github.com/darkwebdev/home-api.git && \
cd home-api && \
npm i

COPY app /app

EXPOSE 8080

ENTRYPOINT ["sh", "/app/entry.sh"]
