FROM python:3.11-rc-alpine

ENV PYTHONUNBUFFERD 1

COPY ./requierments.txt /requierments.txt
RUN pip install -r /requierments.txt


RUN mkdir /app
WORKDIR /app
COPY ./app /app


RUN adduser -D user
USER user
