from pydantic import BaseSettings, Field

class Settings(BaseSettings):
    # e.g. postgresql://mobility_app:****@localhost:5432/mobility
    DATABASE_URL: str = Field(...)
    class Config:
        env_file = "configs/.env"  # load key=value pairs from this file

settings = Settings()
