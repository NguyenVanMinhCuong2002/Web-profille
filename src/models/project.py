from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, String 
from database.connection import Base


class Project(Base):
    __tablename__ = 'projects'
    id = Column(Integer, primary_key=True)
    name = Column(String(255), unique=True, nullable=False)
    description = Column(String(255), unique=True, nullable=True)
    github_link = Column(String(255), unique=True, nullable=False)
    link = Column(String(255), unique=True, nullable=False)