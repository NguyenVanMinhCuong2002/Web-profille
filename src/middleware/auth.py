from functools import wraps
from flask import session, jsonify

def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if "id" not in session:
            return jsonify({"error": "Chưa đăng nhập"}), 401
        return f(*args, **kwargs)
    return decorated_function