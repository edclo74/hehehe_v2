extends Node2D
@onready var spawn_points = $Spawnpoints.get_children()
@onready var SpawnTimer = $Spawnpoints/Timer
@onready var World = get_node("/root/endless_game")
@onready var camera = $".."
const enemy_file = preload("res://Scenes/enemy.tscn")


func spawn_enemy():
	var enemy = enemy_file.instantiate()
	var spawn_point = spawn_points.pick_random()
	enemy.global_position = spawn_point.global_position
	#ERROR ^
	World.add_child(enemy)
func _on_timer_timeout():
	spawn_enemy()
