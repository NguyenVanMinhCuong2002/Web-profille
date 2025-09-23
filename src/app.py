from flask import Flask
from controllers.home_controller import home_bp
from controllers.projects_controller import projects_bp
from controllers.admin_controller import admin_bp
from config import Config
import time
from database.connection import db


app = Flask(__name__)


app.config.from_object(Config)
db.init_app(app)

@app.before_request
def global_delay():
    time.sleep(0.02)  # delay 2 giây cho tất cả request

# register blueprint
app.register_blueprint(home_bp)
app.register_blueprint(projects_bp)
app.register_blueprint(admin_bp)

if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=5001)