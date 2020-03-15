extends KinematicBody2D

const GRAVITY = 10
const SPEED = 50
const FLOOR = Vector2(0, -1)

export var health = 1

var velocity = Vector2()

var is_dead = false

var direction = 1

func _ready():
	pass

func _dead():
	is_dead = true
	velocity = Vector2(0, 0)
	$CollisionShape2D.disabled = true
	$Timer.start()

func _physics_process(delta):
	if is_dead == false:
		velocity.x = SPEED * direction
	
		if direction == -1:
			$Sprite.flip_h = false
		else:
			$Sprite.flip_h = true
	
	
		velocity.y += GRAVITY
	
		velocity = move_and_slide(velocity, FLOOR)
	
	if is_on_wall():
		direction = direction * -1
	


func _on_Timer_timeout():
	queue_free()
