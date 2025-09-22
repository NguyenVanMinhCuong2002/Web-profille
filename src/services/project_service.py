from sqlalchemy.orm import Session
from models.project import Project
from sqlalchemy.exc import IntegrityError


class ProjectsService:
    def __init__(self, db_session:Session):
        self.db_session = db_session
        self.model = Project


    def get_project(self,id:int):
        project = self.db_session.get_one(
            self.model,
            id
            )
        return project 
    
    
    def create_project(
            self, 
            name: str, 
            github: str, 
            link: str, 
            description:str
        ):
        
        new_project = self.model(
                              name=name, 
                              github_link=github, 
                              link=link,
                              description=description
                              )
        
        self.db_session.add(new_project)

        try:

            self.db_session.commit()
            self.db_session.refresh(new_project)

        except IntegrityError:

            self.db_session.rollback()
            raise ValueError()
        
        return new_project
    

    
    def delete_project(self, Id:int):

        project = self.db_session.get(
            self.model,
            Id
        )

        self.db_session.delete(project)

        try:

            self.db_session.commit()

            return True
        
        except ValueError as e:

            return False, 500
        

        
    def update_project(
        self,
        Id: int,
        name: str = None,
        github: str = None,
        link: str = None,
        description: str = None,
    ):

        project = self.db_session.get(self.model, Id)

        if project is None:
            return False, 404   # hoặc raise Exception("Project not found")

        try:
            # Cập nhật các field nếu có giá trị mới
            if name is not None:
                project.name = name
            if github is not None:
                project.github_link = github
            if link is not None:
                project.link = link
            if description is not None:
                project.description = description

            self.db_session.commit()
            self.db_session.refresh(project)

            return project, 200
        
        except Exception as e:
            self.db_session.rollback()
            return e, 500


    
    def get_list_project(self):

        projects = self.db_session.query(self.model).all()

        return projects