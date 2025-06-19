from flask import Blueprint, render_template, request, redirect, url_for, session, flash
from extensions import mysql
import MySQLdb.cursors


board_bp = Blueprint('board', __name__, url_prefix='/board')

@board_bp.route('/')
def board_page():
    try:
        cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cur.execute("SELECT idx, title, content FROM Board ORDER BY created_at DESC")
        posts = cur.fetchall()
        cur.close()
    except Exception as e:
        posts = []
        print(f"DB Error: {e}")  # 필요시 flash 처리 가능

    return render_template('board.html', posts=posts)


@board_bp.route('/write', methods=['GET', 'POST'])
def write():
    if 'username' not in session:
        flash("Login required to write a post.", "error")
        return redirect(url_for('auth.login'))

    if request.method == 'POST':
        title = request.form['title']
        content = request.form['content']
        author = session['username']

        try:
            cur = mysql.connection.cursor()
            cur.execute("INSERT INTO Board (title, author, content) VALUES (%s, %s, %s)",
                        (title, author, content))
            mysql.connection.commit()
            cur.close()
            flash("Post submitted successfully!", "success")
            return redirect(url_for('board.board_page'))  # 게시글 목록으로 리디렉션 (필요시 수정)
        except Exception as e:
            flash(f"Database error: {e}", "error")

    return render_template('board_write.html')


@board_bp.route('/read/<int:idx>')
def read_post(idx):
    try:
        cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cur.execute("SELECT * FROM Board WHERE idx = %s", (idx,))
        post = cur.fetchone()

        # 조회수 증가
        cur.execute("UPDATE Board SET views = views + 1 WHERE idx = %s", (idx,))
        mysql.connection.commit()
        cur.close()

        if post is None:
            flash("Post not found.", "error")
            return redirect(url_for('board.board_page'))

    except Exception as e:
        flash(f"Database error: {e}", "error")
        return redirect(url_for('board.board_page'))

    return render_template("board_read.html", post=post)
