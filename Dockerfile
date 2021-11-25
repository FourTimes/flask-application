FROM alpine

RUN apk add python3

RUN apk add py3-pip

WORKDIR /usr/app

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

COPY requirments.txt .

RUN chown -R appuser:appgroup /usr/app

USER appuser

RUN pip3 install -r requirments.txt

COPY . .

CMD ["python3", "app.py"]

