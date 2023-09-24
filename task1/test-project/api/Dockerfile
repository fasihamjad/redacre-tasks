FROM python:3.8-alpine

RUN apk update && apk upgrade

RUN apk add --no-cache build-base python3-dev libffi-dev


WORKDIR /app


COPY . /app


RUN pip install --no-cache-dir -r requirements.txt


EXPOSE 80


CMD ["python", "app.py"]
