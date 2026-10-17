extends Polygon2D

func _process(_delta: float) -> void:
	var skill_dir := Input.get_vector("skills_left", "skills_right", "skills_up", "skills_down")
	# Поворачиваем только если стик отклонен (не нулевой)
	# Это решает проблему сброса угла вправо при отпускании
	if skill_dir != Vector2.ZERO:
		self.rotation = skill_dir.angle()
