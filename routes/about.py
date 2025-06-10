from flask import Blueprint, render_template

about_bp = Blueprint('about', __name__, url_prefix='/about')

@about_bp.route('/')
def about_page():
    # 임시 게시글 데이터
    posts = [
        {"id": 1, "title": "첫 번째 글", "content": "이건 첫 번째 글의 내용입니다."},
        {"id": 2, "title": "두 번째 글", "content": "이건 두 번째 글의 내용입니다."},
        {"id": 3, "title": "세 번째 글", "content": "세 번째 글이 여기에 표시됩니다."}
    ]
    return render_template('about.html', posts=posts)
