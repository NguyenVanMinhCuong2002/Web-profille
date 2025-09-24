from sqlalchemy.exc import IntegrityError
from src.models.users import User
from sqlalchemy.orm import Session
from passlib.context import CryptContext

pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

class UserService:
    def __init__(self, db_session: Session):
        self.db_session = db_session
        self.model = User



    def create_user(self, name: str, email: str, password:str) -> User:

        hash_password = pwd_context.hash(password)
        new_user = User(username=name, email=email, password=hash_password)
        self.db_session.add(new_user)

        try:

            self.db_session.commit()
            self.db_session.refresh(new_user)  # load ID tự động sinh

        except IntegrityError:
            
            self.db_session.rollback()
            raise ValueError("Email đã tồn tại")
        
        return new_user
    


    def __verify_password(self, plain_password: str, hashed_password: str) -> bool:

        return pwd_context.verify(plain_password, hashed_password)
    
    

    def login(self, email: str, password: str):

        user = self.db_session.query(self.model).filter(self.model.email == email).first()

        if not user:

            return False
        
        if not self.__verify_password(password, user.password):

            return False
        
        return user
