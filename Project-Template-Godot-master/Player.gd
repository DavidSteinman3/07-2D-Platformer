extends KinematicBody2D

export var MAX_HEALTH = 3
export var score = 0

const UP = Vector2(0,-1)
const ACCELERATION = 200
const GRAVITY = 15
const SPEED = 3500
const JUMP_HEIGHT = 500

onready var health = MAX_HEALTH

var motion = Vector2()

signal health_changed
signal score_changed

func _ready():
	emit_signal("health_changed")
	emit_signal("score_changed")

func change_health(h):
	health += h
	emit_signal("health_changed")
	if health <= 0:
		get_tree().change_scene("res://Stages/End.tscn")

func change_score(s):
	score += s
	emit_signal("score_changed")

func _physics_process(delta):
	motion.y += GRAVITY
	
	var friction = false
	if Input.is_action_just_pressed("move_right"):
		motion.x = min(motion.x+ACCELERATION, SPEED)
		$Sprite.flip_h = false
		$Sprite.play("Run")
		
	elif Input.is_action_just_pressed("move_left"):
		motion.x = min(motion.x-ACCELERATION, SPEED)
		$Sprite.flip_h = true
		$Sprite.play("Run")
		
	else:
		$Sprite.play("Idle")
		friction = true
	
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			motion.y = -JUMP_HEIGHT
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2) 
	else:
		$Sprite.play("Jump")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05) 
			
	move_and_slide(motion, UP)
	pass
	