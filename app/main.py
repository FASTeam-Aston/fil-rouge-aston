from flask import Flask, render_template, request, redirect, url_for, session
from flask_mysqldb import MySQL
#logstash

from logstash_async.handler import AsynchronousLogstashHandler
from logstash_async.formatter import FlaskLogstashFormatter


import MySQLdb.cursors

app = Flask(__name__)

app.secret_key = 'la vie est un trop long fleuve tranquille'
app.config.from_object('config')

# Intialize MySQL
mysql = MySQL(app)

# http://localhost:5000/ - this will be the login page, we need to use both GET and POST requests
@app.route('/', methods=['GET', 'POST'])
def login():
    # Output message if something goes wrong...
    msg = ''

    # Check if "username" and "password" POST requests exist (user submitted form)
    if request.method == 'POST' and 'email' in request.form and 'password' in request.form:
        # Create variables for easy access
        email = request.form['email']
        password = request.form['password']

        # Check if account exists using MySQL
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM FORMATEUR WHERE email = %s AND password = password(%s)', (email, password,))
        # Fetch one record and return result
        account = cursor.fetchone()

        # If account exists in accounts table in out database
        if account:
            # Create session data, we can access this data in other routes
            session['loggedin'] = True
            session['Id_Formateur'] = account['Id_Formateur']
            session['email'] = account['email']
            # Redirect to home page
            return redirect(url_for('home'))
        else:
            # Account doesnt exist or username/password incorrect
            msg = 'Incorrect email/password!'

    return render_template('index.html', msg=msg)

# http://localhost:5000/logout - this will be the logout page
@app.route('/logout')
def logout():
    # Remove session data, this will log the user out
   session.pop('loggedin', None)
   session.pop('Id_Formateur', None)
   session.pop('email', None)
   # Redirect to login page
   return redirect(url_for('login'))

# http://localhost:5000/home - this will be the home page, only accessible for loggedin users
@app.route('/home')
def home():
    # Check if user is loggedin
    if 'loggedin' in session:
        # We need all the account info for the user so we can display it on the home page
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT FORMATEUR.*, FORMATION.* FROM FORMATEUR, FORMATION '
                       'WHERE FORMATION.Id_Formateur = FORMATEUR.Id_Formateur AND FORMATEUR.Id_Formateur = %s '
                       'ORDER BY FORMATION.Date_debut',
                       (session['Id_Formateur'],))
        account = cursor.fetchall()
        return render_template('home.html', account=account)
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))

# http://localhost:5000/formation - this will be the home page, only accessible for loggedin users
@app.route('/formation/<Id_Formation>')
def formation(Id_Formation):
    # Check if user is loggedin
    if 'loggedin' in session:
        # We need all the account info for the user so we can display it on the home page
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT FORMATION.Intitule, PRESENCE.*, ELEVE.* FROM PRESENCE, ELEVE, FORMATION '
                       'WHERE PRESENCE.Id_Eleve = ELEVE.Id_Eleve AND FORMATION.Id_Formation = PRESENCE.Id_Formation '
                       'AND PRESENCE.Id_Formation = %s',
                       Id_Formation)
        account = cursor.fetchall()
        return render_template('formation.html', account=account)
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))

# http://localhost:5000/profile - this will be the profile page, only accessible for loggedin users
@app.route('/profile')
def profile():
    # Check if user is loggedin
    if 'loggedin' in session:
        # We need all the account info for the user so we can display it on the profile page
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM FORMATEUR WHERE Id_Formateur = %s', (session['Id_Formateur'],))
        account = cursor.fetchone()
        # Show the profile page with account info
        return render_template('profile.html', account=account)
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))

@app.route('/userhome')
def Student_attendance_chart():
    return render_template('Student_attendance_chart.html')

#table of students
@app.route('/user')
def user_attendance_chart():
    allUser = [
        {
            "firstname": "Test1",
            "lastname": "lastname1",
        },
        {
            "firstname": "Test2",
            "lastname": "lastname2",
        },
        {
            "firstname": "Test3",
            "lastname": "lastname3",
        },
        {
            "firstname": "Test4",
            "lastname": "lastname4",
        }
    ]
    return render_template('user.html', users=allUser, len=len(allUser))
