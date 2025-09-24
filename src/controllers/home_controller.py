from flask import Blueprint, render_template, render_template_string, request
import os 

home_bp = Blueprint("home", __name__, url_prefix="/", template_folder="/")


@home_bp.route("/", methods=["GET"])
def get_home_page():
    return render_template("pages/index.html")

@home_bp.route("/contact", methods=["GET"])
def get_contact_page():
    return render_template("pages/contact.html")


@home_bp.route("/resume")
def view_file():
    # Lấy tham số file từ query string
    filename = request.args.get("file", "/")
    
    try:
        return render_template(filename)
    except Exception as e:
        return "error:" + e
