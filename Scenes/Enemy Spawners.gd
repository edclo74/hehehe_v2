extends Node2D

@onready var spawn_points = $Spawnpoints.get_children()
@onready var SpawnTimer = $Spawnpoints/Timer
@onready var World = get_node("/root/endless_game")
@onready var camera = $".."
const enemy_file = preload("res://Scenes/enemy.tscn")

func spawn_enemy():
	var enemy = enemy_file.instantiate()
	var spawn_point = spawn_points.pick_random()
	if spawn_point is Node2D:  # Ensure spawn_point is a Node2D
		enemy.global_position = spawn_point.global_position
		World.add_child(enemy)
	else:
		print("Selected spawn_point is not a Node2D")

func _on_timer_timeout():
	spawn_enemy()
