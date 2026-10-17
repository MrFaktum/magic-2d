extends CharacterBody2D

const SPEED : float = 300.0
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var move_direction: Vector2 = Vector2.ZERO:
	set(new_value):
		var rounded_val = new_value.snapped(Vector2(0.001, 0.001))
		if move_direction != rounded_val:
			move_direction = rounded_val
			_on_move_direction_changed(move_direction)

func _process(_delta: float) -> void:
	# Только считываем ввод (нагрузка нулевая)
	move_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

# СОБЫТИЯ: срабатывает ТОЛЬКО когда стик изменил угол/силу нажатия
func _on_move_direction_changed(new_dir: Vector2) -> void:
	if new_dir != Vector2.ZERO:
		velocity = new_dir * SPEED
		sprite.play("run")
		# Поворот спрайта: true если смотрим влево
		sprite.flip_h = (new_dir.x < 0)
	else:
		velocity = Vector2.ZERO
		sprite.play("idle")

# ФИЗИКА: непрерывно перемещает тело, пока есть скорость
func _physics_process(_delta: float) -> void:
	# Если персонаж не стоит на месте, двигаем его
	if velocity != Vector2.ZERO:
		move_and_slide()
