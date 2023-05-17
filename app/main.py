from fastapi import FastAPI
from app.config import settings

app = FastAPI()


@app.get("/")
def test():
    return {"msg":"hello world"}


@app.get("/config")
async def get_config():
    print(settings.dict())
    return {"hera":settings.hinge}

@app.get("/test")
async def test_if_print():
    print("hello")
    return {"msg":"did it print anything?"}

