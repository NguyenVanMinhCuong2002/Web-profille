from flask import Blueprint, render_template, request
import os 

home_bp = Blueprint("home", __name__, url_prefix="/", template_folder="/")


ALLOWED_TEMPLATES = {
    "resume": "pages/resume.html",
    "about": "pages/about.html",
    "contact": "pages/contact.html"
}

@home_bp.route("/", methods=["GET"])
def get_home_page():
    return render_template("pages/index.html")

@home_bp.route("/contact", methods=["GET"])
def get_contact_page():
    return render_template("pages/contact.html")


@home_bp.route("/resume")
def view_file():
    # Lấy tham số file từ query string
    filename = request.args.get("file")

    if not filename:
        return 400

    # Kiểm tra trong white list
    if filename not in ALLOWED_TEMPLATES:
        return 403

    try:
        return render_template(ALLOWED_TEMPLATES[filename])
    except Exception as e:
        return "error: " + str(e)