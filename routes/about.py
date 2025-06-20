from flask import Blueprint, render_template, request, redirect, url_for, flash, session
from extensions import mysql
import MySQLdb.cursors

about_bp = Blueprint('about', __name__, url_prefix='/about')

@about_bp.route('/')
def about_page():
    try:
        cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cur.execute("SELECT * FROM about ORDER BY created_at DESC")
        all_posts = cur.fetchall()
        cur.close()

        # 카테고리별로 그룹화
        categories = {}
        for post in all_posts:
            cat = post['category']
            categories.setdefault(cat, []).append(post)

    except Exception as e:
        categories = {}
        print(f"DB Error: {e}")

    return render_template('about.html', categories=categories)



@about_bp.route('/write', methods=['GET', 'POST'])
def write():
    if 'username' not in session:
        flash("Login required to write a post.", "error")
        return redirect(url_for('auth.login'))

    if request.method == 'POST':
        title = request.form['title']
        category = request.form['category']
        content = request.form['content']
        username = session['username']

        print("🟡 title:", title)
        print("🟢 category:", category)
        print("🔵 content:", content)


        try:
            cur = mysql.connection.cursor()
            cur.execute("""
                INSERT INTO about (title, username, category, content)
                VALUES (%s, %s, %s, %s)
            """, (title, username, category, content))
            mysql.connection.commit()
            cur.close()
            flash("Post created successfully.", "success")
            return redirect(url_for('about.about_page'))  # 목록 페이지로 이동
        except Exception as e:
            flash(f"DB Error: {e}", "error")

    return render_template('about_write.html')


@about_bp.route('/read/<int:idx>')
def read(idx):
    try:
        cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cur.execute("SELECT * FROM about WHERE idx = %s", (idx,))
        post = cur.fetchone()

        if post:
            cur.execute("UPDATE about SET views = views + 1 WHERE idx = %s", (idx,))
            mysql.connection.commit()
        cur.close()

        if not post:
            flash("Post not found.", "error")
            return redirect(url_for('about.about_page'))

    except Exception as e:
        flash(f"DB Error: {e}", "error")
        return redirect(url_for('about.about_page'))

    return render_template("about_read.html", post=post)
