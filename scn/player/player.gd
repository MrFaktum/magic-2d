extends CharacterBody2D

const SPEED = 300.0

func _physics_process(_delta: float) -> void:
		# Получаем вектор направления сразу по двум осям
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	if direction != Vector2.ZERO:
		velocity = direction * SPEED
		$AnimatedSprite2D.play("run")
		# Поворот спрайта
		$AnimatedSprite2D.flip_h = (direction.x < 0)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)
		$AnimatedSprite2D.play("idle")
	move_and_slide()
