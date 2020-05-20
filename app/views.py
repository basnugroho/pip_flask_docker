from flask import render_template
from app import app

@app.route('/')
def home():
   return "This url have point in polygon engine"

@app.route('/template')
def template():
    return render_template('home.html')
