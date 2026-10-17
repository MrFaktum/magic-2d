extends Node

const SpawnWallScript = preload("res://scn/player/playerSkills/spawn_wall.gd")



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_button_skills_a_pressed() -> void:
	var wall_spawner = SpawnWallScript.new()
	var spawn_pos := Vector2(0, 0)
	wall_spawner.spawn(self, spawn_pos)

func _on_button_skills_b_pressed() -> void:
	pass # Replace with function body.
