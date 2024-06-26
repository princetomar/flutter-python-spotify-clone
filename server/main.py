# import fast api
from fastapi import FastAPI, HTTPException, Request 
from pydantic import BaseModel
from sqlalchemy import LargeBinary,VARCHAR, TEXT,Column,create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.declarative import  declarative_base
import uuid
import bcrypt

# create instance of fastapi class
app = FastAPI()
DATABASE_URL='postgresql://postgres:root@localhost:5433/listenermusic'
engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit = False, autoflush=False, bind=engine)

# get access to the database
db = SessionLocal()
# use app for creating api routes

Base = declarative_base()

class RegisterUser(BaseModel):
    name: str
    email: str
    password: str

# 1. App get route

# if we pass a class in function parameters - it'll consider as the request body for POST API
# if we pass another datatype, such as int/str/double e.t.c., it'll consider as the query parameter

class User(Base):
    # define table name
    __tablename__ = 'users'

    id = Column(TEXT, primary_key=True)
    name = Column(VARCHAR(100))
    email = Column(VARCHAR(100))
    password = Column(LargeBinary)

# AUTH ROUTES
@app.post("/signup")

def signup_user(user: RegisterUser): 
    
    
    # check if user already exists or not in db
    user_db = db.query(User).filter(User.email == user.email).first()
    if user_db:
        raise HTTPException(400,'User with the same email already exists!')
    
    hashed_ps = bcrypt.hashpw(user.password.encode(), bcrypt.gensalt())

    # if user doesn't exists, create it.
    user_db = User(id= str(uuid.uuid4()), email=user.email, password=user.password, name=user.name)
    db.add(user_db)
    db.commit()
    db.refresh()

    return user_db

Base.metadata.create_all(engine)