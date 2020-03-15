extends RigidBody2D

export var health = 3
export var score = 500
onready var Player = get_node("res://Scenes/Player.tscn")

func _ready():
	pass

func _physics_process(delta):
	var colliding = get_colliding_bodies()
	for c in colliding:
		if c.name == "Player":
			Player.health_lowered(health)
			queue_free()
			Player.score_increased(score)
			queue_free()

