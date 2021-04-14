from flask import Flask, render_template, request, redirect, url_for, session
from flask_mysqldb import MySQL
import MySQLdb.cursors

app = Flask(__name__)

app.secret_key = 'la vie est un trop long fleuve tranquille'

# Entrez les détails de votre connexion à la base de données ci-dessous
app.config['MYSQL_HOST'] = 'db'
app.config['MYSQL_USER'] = 'areyouhere'
app.config['MYSQL_PASSWORD'] = 'aka47-areyouhere'
app.config['MYSQL_DB'] = 'areyouhere'

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
        # User is loggedin show them the home page
        return render_template('home.html', email=session['email'])
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


@app.route('/user')
def user_attendance_chart():
    allUser = [
        {
            "firstname": "Ford",
            "lastname": "Mustang",
        },
        {
            "firstname": "Ford",
            "lastname": "Mustang",
        },
        {
            "firstname": "Ford",
            "lastname": "Mustang",
        },
        {
            "firstname": "Ford",
            "lastname": "Mustang",
        }
    ]
    return render_template('user.html', users=allUser, len=len(allUser))

# On va avoir un conflit ici !!!