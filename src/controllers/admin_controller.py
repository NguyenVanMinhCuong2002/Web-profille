from flask import Blueprint, render_template, request, jsonify, redirect, session
from src.services.user_service import UserService
from src.services.project_service import ProjectsService
from src.database.connection import db
from src.middleware.auth import login_required

admin_bp = Blueprint("admin", __name__, url_prefix="/admin")

product_service = ProjectsService(db_session=db.session)
user_service = UserService(db_session=db.session)



@admin_bp.route("/", methods=["GET"])
@login_required
def get_admin_page():
    projects = product_service.get_list_project()

    result = [
        {
            "id": p.id,
            "name": p.name,
            "github": p.github_link,
            "link": p.link,
            "description": p.description
        } for p in projects
    ]

    return render_template("admin/tables.html", projects=result)



@admin_bp.route("/create-project-form", methods=["GET"])
@login_required
def get_create_project_form():
    return render_template("admin/createt_project.html")




@admin_bp.route("/update-project-form/<int:Id>", methods=["GET"])
@login_required
def get_update_project_form(Id):
    project = product_service.get_project(Id)
    result = {
            "id": project.id,
            "name": project.name,
            "github": project.github_link,
            "link": project.link,
            "description": project.description
        } 
    

    return render_template("admin/update_project.html", project=result)




@admin_bp.route("/login", methods= ["GET"])
def get_login_page():
    return render_template("admin/login.html")



@admin_bp.route("/login", methods=["POST"])
def login():
    data = request.form 

    email = data.get("email")
    password = data.get("password")

    try:

        user = user_service.login(email=email, password=password)
        if user:
            session["id"] = user.id
            session["email"] = user.email  
            session["username"] = user.username

            return redirect("/admin")
        
        else:
            return render_template("admin/login.html", message="Email hoặc mật khẩu bị sai")

    except ValueError as e:

        return jsonify({"error": str(e)}), 500



@admin_bp.route("/register", methods= ["GET"])
# @login_required
def get_register_page():
    return render_template("admin/register.html")



@admin_bp.route("/logout")
@login_required
def logout():
    session.clear()  # xóa hết dữ liệu trong session
    return redirect("/admin/login")



@admin_bp.route("/register", methods=["POST"])
# @login_required
def register():
    data = request.form 

    username = data.get("username")
    email = data.get("email")
    password = data.get("password")

    try:

        user_service.create_user(name=username, email=email, password=password)
        return jsonify({"status": "success"})

    except ValueError as e:

        return jsonify({"error": str(e)}), 500

