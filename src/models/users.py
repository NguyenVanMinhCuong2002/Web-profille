from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String 
from database.connection import Base
import os


class User(Base):
    __tablename__ = 'users'
    id = Column(Integer, primary_key=True)
    username = Column(String(255), unique=True, nullable=False)
    email = Column(String(255), unique=True, nullable=False)
    password = Column(String(255), unique=True, nullable=False)