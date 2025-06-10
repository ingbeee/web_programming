from flask import Blueprint, render_template

food_bp = Blueprint('food', __name__, url_prefix='/food')

@food_bp.route('/')
def food_page():
    # 임시 게시글 데이터
    posts = [
        {"id": 1, "title": "첫 번째 글", "content": "이건 첫 번째 글의 내용입니다."},
        {"id": 2, "title": "두 번째 글", "content": "이건 두 번째 글의 내용입니다."},
        {"id": 3, "title": "세 번째 글", "content": "세 번째 글이 여기에 표시됩니다."}
    ]
    return render_template('food.html', posts=posts)
