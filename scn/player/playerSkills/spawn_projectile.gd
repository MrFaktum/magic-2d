extends Node

const ProjectileScene = preload("res://scn/scnSkills/projectile/projectile.tscn")

func spawn(caller_node: Node, pos: Vector2, direction: Vector2, speed: float) -> void:
	# Копия снаряда в переменной
	var projectile_instance : Area2D = ProjectileScene.instantiate()
	# Позиция спавна
	projectile_instance.global_position = pos
	# Начальная скорость
	projectile_instance.velocity = direction * speed
	# Начальная поворот спрайта относительно направления
	projectile_instance.rotation = direction.angle()
	# Спавн снаряда в корневой сцене
	caller_node.get_tree().current_scene.add_child(projectile_instance)
