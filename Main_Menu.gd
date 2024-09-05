extends Control
@onready var gun = $Gun
@onready var music = $Musik
func _physics_process(delta):
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	gun.position = get_global_mouse_position()
	gun.rotation_degrees = 45
func _on_button_pressed():
	$Gun.play("default")
	await gun.animation_finished
	get_tree().change_scene_to_file("res://Scenes/endless_game.tscn")
	pass # Replace with function body.


func _on_options_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Options.tscn")
	pass # Replace with function body.

func _on_quit_button_pressed():
	get_tree().quit()
	pass # Replace with function body.
