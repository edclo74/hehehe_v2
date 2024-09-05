extends Control
@onready var gun = $Gun

func _physics_process(delta):
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	gun.position = get_global_mouse_position()
	gun.rotation_degrees = 45


func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/Main_Menu.tscn")
