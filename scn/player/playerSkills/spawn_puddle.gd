extends Node

const PuddleScene = preload("res://scn/scnSkills/puddle/puddle.tscn")

func spawn(caller_node: Node, pos: Vector2) -> void:
	var puddle_instance = PuddleScene.instantiate()
	puddle_instance.global_position = pos
	caller_node.get_tree().current_scene.add_child(puddle_instance)
