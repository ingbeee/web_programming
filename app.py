from flask import Flask, render_template
from extensions import mysql  # 여기서 가져와
from routes import blueprints
import settings

app = Flask(__name__)
app.secret_key = 'eunji-super-secret-123'

# DB 설정
app.config['MYSQL_HOST'] = settings.MYSQL_HOST
app.config['MYSQL_USER'] = settings.MYSQL_USER
app.config['MYSQL_PASSWORD'] = settings.MYSQL_PASSWORD
app.config['MYSQL_DB'] = settings.MYSQL_DB
app.config['MYSQL_PORT'] = settings.MYSQL_PORT

# MySQL 초기화
mysql.init_app(app)

# 블루프린트 등록
for bp in blueprints:
    app.register_blueprint(bp)

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/db_check')
def db_check():
    try:
        cur = mysql.connection.cursor()
        cur.execute("SELECT 1")
        result = cur.fetchone()
        cur.close()
        return f"MySQL 연결 성공! 결과: {result[0]}"
    except Exception as e:
        return f"MySQL 연결 실패: {str(e)}"

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=4000)
