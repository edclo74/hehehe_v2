extends Control
@onready var gun = $Gun
@onready var Score = $Death_screen_Score
@onready var Music = $Musikness
func _physics_process(delta):
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	gun.position = get_global_mouse_position()
	gun.rotation_degrees = 45
	Score.text = "Your Score Is " + str(Points.Points)



func _on_main_menu_pressed():
	$Gun.play("default")
	await gun.animation_finished
	get_tree().change_scene_to_file("res://Scenes/Main_Menu.tscn")
