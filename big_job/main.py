from flask import Flask, render_template
import mysql.connector

app = Flask(__name__)

db_config = {
    'host': '127.0.0.1',
    'user': 'root',
    'password': '',
    'database': 'carbonfootprint'
}

db = mysql.connector.connect(**db_config)

@app.route('/')
def index():
    cursor = db.cursor()
    cursor.execute("SELECT * FROM country")
    data_country = cursor.fetchall()
    cursor.execute("SELECT * FROM world")
    data_world = cursor.fetchall()
    cursor.close()
    return render_template('index.html', data_country=data_country, data_world=data_world)


if __name__ == '__main__':
    app.run(debug=True)
