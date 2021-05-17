from flask import Flask, render_template
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)

db = SQLAlchemy(app)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql:///vagrant'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SECRET_KEY'] = 'laöskjdflkhjiuh1234'

def sql(rawSql, sqlVars={}):
    assert type(rawSql)==str
    assert type(sqlVars)==dict
    res=db.session.execute(rawSql, sqlVars)
    db.session.commit()
    return res

@app.route("/")
def hello_world():
    persons=sql("SELECT * FROM employees")
    return render_template("home.html", persons=persons)


