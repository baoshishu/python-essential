FROM python:3.7.3-slim-stretch
ENV TZ=Asia/Shanghai
ENV PIP_DEFAULT_TIMEOUT=1000
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN apt-get update && apt-get upgrade -y && apt-get install -y vim git gcc build-essential libffi-dev
RUN pip install -U pip
RUN pip install poetry==0.12.16 py-spy -i https://mirrors.aliyun.com/pypi/simple
RUN poetry config settings.virtualenvs.create false
RUN pip install gunicorn pycrypto ipython pandas ipdb mypy flask sqlalchemy django celery redis \
pyjwt pymysql requests graphene pytest jupyter  -i https://mirrors.aliyun.com/pypi/simple
