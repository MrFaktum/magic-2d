extends VirtualJoystick


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
var direction := Input.get_vector("skills_left", "skills_right", "skills_up", "skills_down")

var joystick_vector: Vector2 = direction:
	set(value):
		joystick_vector = value
		# Выводим текст в консоль, если стик отклонили от центра
		if joystick_vector.length() > 0:
			print("Стик сдвинулся! Координаты: ", joystick_vector)


func _on_flicked(input_vector: Vector2) -> void:
	# Выводим текст в консоль, если стик отклонили от центра
	if input_vector.length() > 0:
		print("Стик сдвинулся! Координаты: ", joystick_vector)
