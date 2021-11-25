#### flask-application

In this application developed by python flask framework.

Application development Requirements

    1. python3 
    2. pip3 
    3. code editor
    4. linux server or docker 

development folder structure is

<!-- ![image](https://user-images.githubusercontent.com/57703276/143470477-39a04c44-89d4-4019-ba22-bfb0831e889f.png) -->

```bash

flask-application
|-- app.py
|-- requirments.txt
|-- static
    |-- css
        |-- style.css
|-- templates
    |-- base.html
    |-- index.html
|-- Dockerfile
|-- Readme.md
```

Explaination of directory structure

1. app.py

```python
# entrypoint of the application
from flask import Flask, render_template
import requests

app = Flask(__name__)

api="https://api.chucknorris.io/jokes/random"

@app.route('/')
def index():
    response = requests.get(api)
    return render_template ("index.html", quotes=response.json())

if __name__ == '__main__':
    app.run(host="0.0.0.0", debug=True)

```
2. requirements.txt

```bash
flask
requests
```
    3. static

    4. templates

    5. Dockerfile
```Dockerfile
# referece image from alpine family
FROM alpine

# Upgrade the packages to avoid the vulnarability
RUN apk upgrade 

# Python3 installation
RUN apk add python3

# Pip3 installtion
RUN apk add py3-pip

# Setup the working directory
WORKDIR /usr/app

# Create the user and group to avoid the root privileges 
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Copy the dependencies files
COPY requirments.txt .

# To setup the user and group privileges from the application directory
RUN chown -R appuser:appgroup /usr/app

# swutch the user mode
USER appuser

# install the dependencies packages
RUN pip3 install -r requirments.txt

# copy the dependencies files
COPY . .

# Run the process
CMD ["python3", "app.py"]
```
    6. Readme.md






output results

![image](https://user-images.githubusercontent.com/57703276/143309870-a43a000c-9333-416f-af96-e400feb0a1a5.png)
