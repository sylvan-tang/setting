FROM docker.io/library/python:3.10.0rc1-bullseye
MAINTAINER www.sylvan.com

WORKDIR /opt
RUN wget https://bootstrap.pypa.io/get-pip.py \
  && python3 get-pip.py \
  && apt update \
  && apt install git \
  && apt install lsof \
  && git clone https://github.com/jimmysong/programmingbitcoin \
  && cd programmingbitcoin && pip install virtualenv \
  && virtualenv -p python3 .env && pip install -r requirements.txt

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]

EXPOSE 8888
