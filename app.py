from flask import Flask, render_template
from flask_session import Session
from flask_cors import CORS, cross_origin
from tempfile import mkdtemp
from werkzeug.exceptions import default_exceptions

# Initializing flask application
app = Flask(__name__)
cors = CORS(app)

# Ensure templates are auto-reloaded
app.config["TEMPLATES_AUTO_RELOAD"] == True

# Ensure responses aren't cached
@app.after_request
def after_request(response):
    response.headers["Cache-Control"] = "no-cache, no-store, must-revalidate"
    response.headers["Expires"] = 0
    response.headers["Pragma"] = "no-cache"
    return response

# Configure session to use filesystem instead of cookies
app.config["SESSION_FILE_DIR"] = mkdtemp()
app.config["SESSION_PERMANENT"] = False
app.config["SESSION_TYPE"] = "filesystem"
Session(app)

# Routes

@app.route("/", methods=["GET", "POST"])
def index():
    """Index route main function"""

    return render_template('index.html')

for code in default_exceptions:
    app.errorhandler(code)
    