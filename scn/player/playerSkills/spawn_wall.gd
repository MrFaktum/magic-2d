extends Node

const WallScene = preload("res://scn/scnSkills/wall/wall.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func spawn(caller_node: Node, pos: Vector2) -> void:
	var wall_instance = WallScene.instantiate()
	wall_instance.global_position = pos
	caller_node.get_tree().current_scene.add_child(wall_instance)
	pass
