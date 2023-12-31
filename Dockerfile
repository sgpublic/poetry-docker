FROM debian:bookworm-20230904-slim

COPY ./*.sh /

WORKDIR /app

RUN sed -i 's/deb.debian.org/mirrors.aliyun.com/' /etc/apt/sources.list.d/*.sources &&\
 apt-get update &&\
 apt-get install python3-pip python3-poetry python3-venv git libfreetype6-dev -y &&\
 pip config set --global global.index-url https://mirrors.aliyun.com/pypi/simple/ &&\
 git config --global --add safe.directory /app &&\
 useradd -m -u 1000 poetry-runner &&\
 mkdir -p /home/poetry-runner/.cache &&\
 chown -R poetry-runner:poetry-runner /home/poetry-runner/.cache

VOLUME /home/poetry-runner/.cache

ENTRYPOINT ["bash", "/docker-entrypoint.sh"]
