from flask import Blueprint, render_template, request, redirect, url_for, flash
from flask_bcrypt import Bcrypt
from extensions import mysql
import MySQLdb.cursors
from flask import session

auth_bp = Blueprint('auth', __name__, url_prefix='/auth')
bcrypt = Bcrypt()

@auth_bp.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        confirm_password = request.form['confirm_password']

        # 비밀번호 확인
        if password != confirm_password:
            flash("Passwords do not match.", "error")
            return redirect(url_for('auth.register'))

        # 비밀번호 해시화
        hashed_pw = bcrypt.generate_password_hash(password).decode('utf-8')

        # 사용자 존재 여부 확인
        cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cur.execute("SELECT * FROM User WHERE username = %s", (username,))
        existing_user = cur.fetchone()
        if existing_user:
            flash("Username already exists.", "error")
            return redirect(url_for('auth.register'))

        # 사용자 등록
        cur.execute("INSERT INTO User (username, password) VALUES (%s, %s)", (username, hashed_pw))
        mysql.connection.commit()
        cur.close()
        flash("Registration successful! Please log in.", "success")
        return redirect(url_for('auth.login'))

    return render_template('register.html')



@auth_bp.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']

        # 사용자 확인
        cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cur.execute("SELECT * FROM User WHERE username = %s", (username,))
        user = cur.fetchone()
        cur.close()

        if user and bcrypt.check_password_hash(user['password'], password):
            session['username'] = user['username']
            session['role'] = user['role']
            flash("Logged in successfully.", "success")
            return redirect(url_for('home'))  # main.home은 너의 홈 라우터 기준

        flash("Invalid username or password.", "error")
        return redirect(url_for('auth.login'))

    return render_template('login.html')

@auth_bp.route('/logout')
def logout():
    session.clear()
    flash("You have been logged out.", "success")
    return redirect(url_for('main.home'))  # 홈으로 리디렉션
