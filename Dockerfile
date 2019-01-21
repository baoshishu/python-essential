FROM python:3.7.0-alpine3.7
RUN apk --no-cache add tzdata && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo "Asia/Shanghai" > /etc/timezone
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories
RUN apk update && apk add bash curl gcc g++ musl-dev python3-dev libffi-dev openssl-dev
ENV PIP_DEFAULT_TIMEOUT=1000
RUN pip install poetry==0.12.11 gunicorn pycrypto ipython pandas ipdb mypy flask sqlalchemy redis \
pyjwt flask-migrate flask-sqlalchemy pymysql requests graphene pytest jupyter  -i https://pypi.douban.com/simple
RUN apk add git
