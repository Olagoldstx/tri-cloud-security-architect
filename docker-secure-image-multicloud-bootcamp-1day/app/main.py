from flask import Flask
import os

app = Flask(__name__)

@app.get("/")
def hello():
    return {"message": "Hello, secure Docker world!", "env": os.environ.get("APP_ENV","prod")}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
