extends Control

@onready var gun = $Gun
var master_bus = AudioServer.get_bus_index("Master")
var music_bus = AudioServer.get_bus_index("Music")
var sfx_bus = AudioServer.get_bus_index("SFX")
var voice_bus = AudioServer.get_bus_index("Voice")
func _on_back_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/Main_Menu.tscn")


func _physics_process(delta):
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		gun.position = get_global_mouse_position()
		gun.rotation_degrees = 45


func _on_master_value_changed(value):
	AudioServer.set_bus_volume_db(master_bus, value)
	
	
	if value == -30:
		AudioServer.set_bus_mute(master_bus,true)
	else:
		AudioServer.set_bus_mute(master_bus,false)


func _on_music_value_changed(value):
	AudioServer.set_bus_volume_db(music_bus, value)
	
	
	if value == -30:
		AudioServer.set_bus_mute(music_bus,true)
	else:
		AudioServer.set_bus_mute(music_bus,false)


func _on_voice_value_changed(value):
	AudioServer.set_bus_volume_db(voice_bus, value)
	
	
	if value == -30:
		AudioServer.set_bus_mute(voice_bus,true)
	else:
		AudioServer.set_bus_mute(voice_bus,false)



func _on_sfx_value_changed(value):
	AudioServer.set_bus_volume_db(sfx_bus, value)
	
	
	if value == -30:
		AudioServer.set_bus_mute(sfx_bus,true)
	else:
		AudioServer.set_bus_mute(sfx_bus,false)
