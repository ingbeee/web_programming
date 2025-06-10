# routes/__init__.py
from .about import about_bp
from .board import board_bp
from .food import food_bp

blueprints = [
    board_bp,
    about_bp,
    food_bp
]
