extends Node

const WallScene = preload("res://scn/scnSkills/wall/wall.tscn")

func spawn(caller_node: Node, pos: Vector2) -> void:
	var wall_instance = WallScene.instantiate()
	wall_instance.global_position = pos
	caller_node.get_tree().current_scene.add_child(wall_instance)
