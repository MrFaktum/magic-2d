@tool # Этот оператор заставляет скрипт работать ПРЯМО В РЕДАКТОРЕ
extends Node2D

# Экспортируем свойства, чтобы их можно было крутить в инспекторе справа
@export var radius: float = 60.0:
	set(value):
		radius = value
		queue_redraw() # Перерисовывает круг в редакторе при изменении радиуса

@export var puddle_color: Color = Color(0.2, 0.6, 1.0, 0.5): # Полупрозрачный синий
	set(value):
		puddle_color = value
		queue_redraw() # Перерисовывает круг при изменении цвета

func _draw() -> void:
	# Рисуем круг в центре узла
	draw_circle(Vector2.ZERO, radius, puddle_color)
