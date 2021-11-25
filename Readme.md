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

    3. static

    4. templates

    5. Dockerfile

    6. Readme.md






output results

![image](https://user-images.githubusercontent.com/57703276/143309870-a43a000c-9333-416f-af96-e400feb0a1a5.png)
