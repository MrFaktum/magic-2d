extends VirtualJoystick


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

var joystick_vector: Vector2 = Vector2.ZERO:
	set(value):
		joystick_vector = value
		# Выводим текст в консоль, если стик отклонили от центра
		if joystick_vector.length() > 0:
			print("Стик сдвинулся! Координаты: ", joystick_vector)
