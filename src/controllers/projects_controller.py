from flask import Blueprint, render_template, request, jsonify, redirect
from src.services.project_service import ProjectsService
from src.database.connection import db
from src.middleware.auth import login_required

projects_bp = Blueprint("projects", __name__)


service = ProjectsService(db_session=db.session)

@projects_bp.route("/projects", methods=["GET"])
def project_page():
    projects = service.get_list_project()

    result = [
        {
            "id": p.id,
            "name": p.name,
            "github": p.github_link,
            "link": p.link,
            "description": p.description
        } for p in projects
    ]

    return render_template("pages/projects.html", projects=result)



@projects_bp.route("/create-project", methods=["POST"])
@login_required
def create_project():

    data = request.form

    name = data.get("name")
    github = data.get("github")
    link = data.get("link")
    description = data.get("description")

    try:

        service.create_project(
            name=name, 
            github=github, 
            link=link, 
            description=description
            )

        return redirect("/admin/")
    
    except ValueError as e:

        return jsonify({"error": str(e)}), 500
    


@projects_bp.route("/delete-project", methods=["POST"])
@login_required
def delete_project():
    
    data = request.form

    id = data.get("Id_project")

    try:
        
        service.delete_project(id)

        return redirect("/admin/")

    except ValueError as e:
        return jsonify({"error": str(e)}), 500
    


@projects_bp.route("/update-project", methods=["POST"])
@login_required
def update_project():
    data = request.form

    id = data.get("Id")
    name = data.get("name")
    github = data.get("github")
    link = data.get("link")
    description = data.get("description")

    try:

        service.update_project(
            Id=id,
            name=name, 
            github=github, 
            link=link, 
            description=description
            )

        return redirect("/admin/")
    
    except ValueError as e:

        return jsonify({"error": str(e)}), 500
    