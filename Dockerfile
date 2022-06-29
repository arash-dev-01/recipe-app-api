FROM python:3.11-rc-alpine

ENV PYTHONUNBUFFERD 1
RUN pip3 install tk
COPY ./requierments.txt /requierments.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
        gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requierments.txt
RUN apk del .tmp-build-deps

RUN mkdir /app
WORKDIR /app
COPY ./app /app


RUN adduser -D user
USER user
