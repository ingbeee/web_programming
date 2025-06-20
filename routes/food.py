from flask import Blueprint, render_template, request, redirect, url_for, flash, session
from extensions import mysql
import MySQLdb.cursors

food_bp = Blueprint('food', __name__, url_prefix='/food')

@food_bp.route('/')
def food_page():
    try:
        cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cur.execute("SELECT idx, title, content, rating FROM food ORDER BY created_at DESC")
        posts = cur.fetchall()
        cur.close()
    except Exception as e:
        flash(f"DB 오류: {e}", "error")
        posts = []

    return render_template('food.html', posts=posts)


@food_bp.route('/write', methods=['GET', 'POST'])
def write():
    if 'username' not in session:
        flash("Login required to write a post.", "error")
        return redirect(url_for('auth.login'))

    if request.method == 'POST':
        title = request.form['title']
        location = request.form['location']
        content = request.form['content']
        rating = float(request.form['rating'])  # ⭐️ 별점 추가
        username = session['username']

        try:
            cur = mysql.connection.cursor()
            cur.execute("""
                INSERT INTO food (title, username, location, content, rating)
                VALUES (%s, %s, %s, %s, %s)
            """, (title, username, location, content, rating))
            mysql.connection.commit()
            cur.close()
            flash("맛집이 등록되었습니다!", "success")
            return redirect(url_for('food.food_page'))  # ✅ 리스트 라우트 정확히
        except Exception as e:
            flash(f"DB 오류: {e}", "error")

    return render_template('food_write.html')



@food_bp.route('/read/<int:idx>')
def read(idx):
    try:
        cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cur.execute("SELECT * FROM food WHERE idx = %s", (idx,))
        post = cur.fetchone()

        if post:
            cur.execute("UPDATE food SET views = views + 1 WHERE idx = %s", (idx,))
            mysql.connection.commit()
        cur.close()

        if not post:
            flash("맛집 게시글을 찾을 수 없습니다.", "error")
            return redirect(url_for('food.food_page'))

    except Exception as e:
        flash(f"DB 오류: {e}", "error")
        return redirect(url_for('food.food_page'))

    return render_template("food_read.html", post=post)

