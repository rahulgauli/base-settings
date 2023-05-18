from pydantic import BaseSettings

class MySettings(BaseSettings):
    name: str
    age: int
    gender: str
    hinge: str


settings = MySettings(_env_file = "local.env", _env_file_encoding='utf-8')
