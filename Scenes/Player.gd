extends CharacterBody2D
var is_ready: bool = true
@export var SPEED = 50
@export var Bullet: PackedScene
@onready var player = $"."
@export var ACCELERATION = 300.0
@export var FRICTION = 300.0
#@onready var Sprite = $AnimatedSprite2D
@onready var background_music = $"../Background"
@onready var world = get_tree().get_first_node_in_group("root")
@onready var cooldown_timer = $Shoot_Timer
@onready var Sprite = $AnimationTree.get("parameters/playback")
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var GunShot = $GunShot
#@onready var hehe = $"../Main Room/hehe"
#@onready var hehe2 = $"../Other_Room/hehe2"
#@onready var hehe3 = $"../Other_Room2/hehe3"
#@onready var hehe4 = $"../hallway/hehe4"
#@onready var hehe5 = $"../hallway_2/hehe5"
#@onready var hehe6 =$"../Area2D/hehe6"
@onready var crosshair = $"../Crosshair"
var direction = Vector2.ZERO
@onready var CameraShake = $CameraShake
var reload = 4
var health = 4
@onready var ray_cast_2d = $RayCast2D
func _ready():
	$AnimationTree.active = true
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	background_music.play()

func _physics_process(delta):
		if health == 0:
			get_tree().change_scene_to_file("res://Scenes/death_scene.tscn")
		var mouse_pos = get_global_mouse_position()
		var shoot = Input.is_action_pressed("shoot") 
		var run = Input.is_action_pressed("run")
		#Movement
		direction = Input.get_vector("left", "right", "up", "down").normalized()
		if direction and run:
			velocity = velocity.move_toward(direction * SPEED * 3, ACCELERATION)
			Sprite.travel("Running") 
		elif direction:
			velocity = velocity.move_toward(direction * SPEED, ACCELERATION)
			Sprite.travel("Walking")
		else:
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION)
			Sprite.travel("Idle")
		
		if velocity.x > 0:
			animated_sprite_2d.flip_h = true
		elif velocity.x < 0:
			animated_sprite_2d.flip_h = false
	
	#Shoot Mechanics
		
		if Input.is_action_just_pressed("shoot") and is_ready:
			CameraShake.play("Cam_Shake")
			$Shoot_Timer.start()
			is_ready = false
			Sprite.travel("Shoot")
			$GunShot.play()
			ray_cast_2d.force_raycast_update()
			var collider = ray_cast_2d.get_collider()
			if collider:
				if collider.is_in_group("Enemy"):
					print("Hit the bastard") 
					if not collider.dead:
						collider.hit()
		else:
			pass
		
		
		if reload == 0:
			print()
			
		else:
			pass
			
		crosshair.position = mouse_pos




func _on_shoot_timer_timeout():
	is_ready = true

func fireball():
	var bullet = Bullet.instantiate()
	add_child(bullet)
	var target  = (player.global_position)
	var heheweew  = bullet.global_position.direction_to(target).normalized()
	bullet.set_direction(heheweew)


func _process(delta):
	#print(health)
	look_at(get_global_mouse_position())

	rotation_degrees += 90
	move_and_slide()
	if health <=0 :
		get_tree().change_scene_to_file("res://Scenes/death_scene.tscn")
	


func _on_main_room_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	pass
	#hehe.hide()
	#hehe2.show()
	#hehe3.show()
	#hehe4.show()
	#hehe5.show()
	#hehe6.show()

func _on_other_room_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	pass
	#hehe.show()
	#hehe2.hide()
	#hehe3.show()
	#hehe4.show()
	#hehe5.show()
	#hehe6.show()

func _on_hallway_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	pass
	#hehe.show()
	#hehe2.show()
	#hehe3.show()
	#hehe4.hide()
	#hehe5.show()
	#hehe6.show()



func _on_hallway_2_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	pass
	#hehe.show()
	#hehe2.show()
	#hehe3.show()
	#hehe4.show()
	#hehe5.hide()
	#hehe6.show()



func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	pass
	#hehe.show()
	#hehe2.show()
	#hehe3.show()
	#hehe4.show()
	#hehe5.show()
	#hehe6.hide()


func _on_other_room_2_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	pass
	#hehe.show()
	#hehe2.show()
	#hehe3.hide()
	#hehe4.show()
	#hehe5.show()
	#hehe6.show()
	
