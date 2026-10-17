extends Area2D

# Переменная, в которую спавнер запишет итоговую скорость и направление
var velocity := Vector2.ZERO

func _ready() -> void:
	await get_tree().create_timer(3.5).timeout
	queue_free()

func _physics_process(delta: float) -> void:
	# Каждый физический кадр двигаем снаряд
	global_position += velocity * delta
