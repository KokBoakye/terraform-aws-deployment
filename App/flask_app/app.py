from flask import Flask, render_template
import psycopg2
import os

app = Flask(__name__)

@app.route("/")
def index():
    conn = psycopg2.connect(
        host=os.environ.get("DB_HOST"),
        user=os.environ.get("DB_USER"),
        password=os.environ.get("DB_PASSWORD"),
        dbname=os.environ.get("DB_NAME")
    )
    cur = conn.cursor()
    cur.execute("SELECT NOW()")
    db_time = cur.fetchone()[0]
    cur.close()
    conn.close()

    return render_template("index.html", db_time=db_time)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000)
