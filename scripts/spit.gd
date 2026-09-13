extends CharacterBody2D

# Movement variables
var spitTargetPos: Vector2
var speed = 100
var maxSpeed = 500

# Nodes (onrady)
@onready var sprite := $Sprite

func _physics_process(_delta: float) -> void:
	var direction = spitTargetPos - global_position
	
	if direction.length() > 5:
		velocity = (spitTargetPos - global_position).normalized() * speed
		if speed < maxSpeed:
			speed *= 1.05
		move_and_slide()
	else:
		queue_free()

func launch(targetPos: Vector2) -> void:
	spitTargetPos = targetPos
	visible = true
	sprite.play("launch")
	velocity = (targetPos - global_position).normalized() * speed
	rotation = velocity.angle()
