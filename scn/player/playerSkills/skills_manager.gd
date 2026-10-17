extends Node

const SpawnWallScript = preload("res://scn/player/playerSkills/spawn_wall.gd")
const ProjectileScript = preload("res://scn/player/playerSkills/spawn_projectile.gd")
const PuddleScript = preload("res://scn/player/playerSkills/spawn_puddle.gd")

func Skill1() -> void:
	var wall_spawner = SpawnWallScript.new()
	#Задаем стартовую позицию
	var spawn_pos := Vector2(0, 0)
	wall_spawner.spawn(self, spawn_pos)

func Skill2() -> void:
	var projectile_spawner = ProjectileScript.new()
	var spawn_pos := Vector2(0, 0)
	# 3. Задаем НАПРАВЛЕНИЕ (куда лететь). Например, вправо по оси X
	var launch_direction := Vector2.RIGHT
	var speed: float = 300.0
	projectile_spawner.spawn(self, spawn_pos, launch_direction, speed)

func Skill3() -> void:
	var puddle_spawner = PuddleScript.new()
	#Задаем стартовую позицию
	var spawn_pos := Vector2(0, 0)
	puddle_spawner.spawn(self, spawn_pos)



func _on_button_skills_a_pressed() -> void:
	Skill3()
	
func _on_button_skills_b_pressed() -> void:
	Skill2()
