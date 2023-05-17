from pydantic import BaseSettings

class MySettings(BaseSettings):
    name: str
    age: int
    gender: str
    hinge: str


settings = MySettings()
