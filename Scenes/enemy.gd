extends CharacterBody2D
@onready var player = get_tree().get_first_node_in_group("Player")
const bullet = preload("res://Scenes/Bullet.tscn")
@export var SPEED = 100
var is_ready: bool = true
@onready var enemy_health = 2
@onready var hands = $Marker2D
var mouse_over = false
@onready var Bullet = preload("res://Scenes/Bullet.tscn")
var cooldown_timer: bool = true
@onready var oof = $AudioStreamPlayer2D
@onready var animator = $Area2D/AnimatedSprite2D
@onready var death = $death
var not_dead = true
var dead = false
var can_see = false
@onready var detection_area = $Area2D/DetectionArea
func hit():
	enemy_health -=1
	oof.play()
	

func _physics_process(delta):
	
	if dead:
		return
	else:
		if can_see:
			velocity = Vector2.ZERO
		else:
			var direction_to_player = global_position.direction_to(player.global_position)
			velocity = direction_to_player * SPEED
		if can_see and cooldown_timer and not_dead:
			shoot()
		else:
			pass
			if dead == true:
				pass
			else:
				look_at(player.global_position)
			move_and_slide()
		if enemy_health == 0:
			_die()

func shoot():
	var bullet = Bullet.instantiate()
	#print("hi")
	add_sibling(bullet)
	$Shoot_Timer.start()
	cooldown_timer = false
	bullet.global_position = hands.global_position
	var target  = (player.global_position)
	var heheweew = bullet.global_position.direction_to(target).normalized()
	bullet.look_at(player.global_position)
	bullet.set_direction(heheweew)

func _process(delta):
	if dead:
		return
		#$Path2D/PathFollow2D.progress_ratio += speed * delta
	if Input.is_action_just_pressed("shoot") and is_ready and mouse_over == true:
		$Shoot_Timer.start()
		enemy_health -= 1
		is_ready = false
		oof.play()


func _die():
	Points.Points += 100
	dead = true
	not_dead = false
	SPEED = 0
	animator.play("dead")
	death.play()
	await animator.animation_finished
	queue_free()
	#speed = 0




func _on_area_2d_mouse_entered():
	mouse_over = true



func _on_area_2d_mouse_exited():
	mouse_over = false



func _on_shoot_timer_timeout():
	cooldown_timer = true


func _on_detection_area_body_entered(body):
	if body.is_in_group("Player"):
		can_see= true




func _on_detection_area_body_exited(body):
	if body.is_in_group("Player"):
		can_see = false # Replace with function body.
