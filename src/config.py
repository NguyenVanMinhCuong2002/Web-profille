from dotenv import load_dotenv
import os
load_dotenv()

USER = os.getenv("USER_DB")
PASSWORD = os.getenv("PASSWORD_DB")
URL = os.getenv("URL_DB")
DB = os.getenv("DB")


class Config:
    SQLALCHEMY_DATABASE_URI = f"mysql+pymysql://{USER}:{PASSWORD}@{URL}/{DB}"
    SQLALCHEMY_TRACK_MODIFICATIONS = False
    SECRET_KEY = "super-secret-key"
