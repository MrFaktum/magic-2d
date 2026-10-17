extends Node

@export var projectile_spawner: Node
@export var puddle_spawner: Node
@export var wall_spawner: Node
@export var heal_spell: Node

# 1. Наш стек. Сюда будут временно складываться строки "A" или "B"
var spell_stack: Array[String] = []

# Максимальный размер стека
const STACK_MAX_SIZE := 2

# 2. Словарь-рецептурник.
# Ключ — комбинация кнопок (строка). 
# Значение — имя функции, которую нужно вызвать (объект Callable).
@onready var spell_recipes: Dictionary = {
	"AA": _spawn_projectile, # Если нажали А, затем А
	"BB": _spawn_puddle,     # Если нажали В, затем В
	"AB": _spawn_wall,       # Если нажали А, затем В
	"BA": _spell_heal        # Если нажали В, затем А (для примера)
}

# --- ФУНКЦИИ НАЖАТИЯ НА КНОПКИ UI ---
func _on_button_skills_a_pressed() -> void:
	_add_to_stack("A")

func _on_button_skills_b_pressed() -> void:
	_add_to_stack("B")

# --- ЛОГИКА СТЕКА ---

# Функция добавляет элемент в стек и проверяет, пора ли кастовать
func _add_to_stack(element: String) -> void:
	spell_stack.append(element)
	print("Стек сейчас: ", spell_stack) # Для отладки в консоли
	
	# Если стек заполнился (набрали 2 элемента)
	if spell_stack.size() == STACK_MAX_SIZE:
		_cast_combined_spell()

# Функция склеивает стек в один ключ и вызывает нужную магию
func _cast_combined_spell() -> void:
	# Склеиваем массив ["A", "B"] в одну строку "AB"
	# В GDScript это делается одной быстрой командой "" .join()
	var recipe_key := "".join(spell_stack)
	
	# Проверяем, есть ли такой рецепт в нашем словаре
	if spell_recipes.has(recipe_key):
		# Берем функцию из словаря по ключу
		var spell_function: Callable = spell_recipes[recipe_key]
		
		# ВЫЗЫВАЕМ ФУНКЦИЮ! У любого Callable есть метод .call()
		spell_function.call()
	else:
		print("Такого заклинания не существует!")
		
	# Очищаем стек для новых комбинаций
	spell_stack.clear()

# --- ВАШИ ФУНКЦИИ СПАВНА ---

func _spawn_projectile() -> void:
	var spawn_pos := Vector2(0, 0)
	var launch_direction := Vector2.RIGHT
	var speed: float = 300.0
	projectile_spawner.spawn(self, spawn_pos, launch_direction, speed)

func _spawn_puddle() -> void:
	var spawn_pos := Vector2(0, 0)
	puddle_spawner.spawn(self, spawn_pos)

func _spawn_wall() -> void:
	var spawn_pos := Vector2(0, 0)
	wall_spawner.spawn(self, spawn_pos)

func _spell_heal() -> void:
	print("Кастуем лечение!")
	# Тут будет вызов вашего skill_heal
