extends Area2D
@onready var Bullet = $"."
@export var SPEED = 3
var direction = Vector2.ZERO
var bullet_damage = 1
@export var health = 4
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	#print("My health is on",health)
	if health < 1:
		print ("dead")
		get_tree().quit()
	else:
		pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float):
	if direction != Vector2.ZERO:
		var velocity = direction * SPEED
		global_position += velocity

func set_direction(direction: Vector2):
	self.direction = direction

func damage_player(amount):

	if health<1:
		pass
	else:
		health-= amount
	



func check_collsions():
	var collisions = $Hurtbox.get_overlapping_bodies()
	if collisions:
		for collision in collisions:
			if collision.is_in_group("Player"):
				damage_player(bullet_damage)

func _on_hurtbox_body_entered(body):
	if body.is_in_group("box"):
		print("hi")
		queue_free()
	if body.is_in_group("Player"):
		#print("tehehe")
		#body.take_damage(bullet_damage)
		body.health -= 1
		queue_free()
