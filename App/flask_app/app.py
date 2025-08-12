from flask import Flask
import psycopg2
import os

app = Flask(__name__)

def get_db_connection():
    conn = psycopg2.connect(
        host=os.getenv('DB_HOST'),
        database='appdb',
        user='appuser',
        password='apppassword'
    )
    return conn

@app.route('/')
def index():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('SELECT NOW();')
    time = cur.fetchone()
    cur.close()
    conn.close()
    return f'Hello from Flask! DB time is {time[0]}'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
