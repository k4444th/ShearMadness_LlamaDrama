extends Node2D

# Nodes (onrady)
@onready var lama := $Llama

# Scenes (onrady)
@onready var spitScene := preload("res://scenes/spit.tscn")

func _input(event):
	if event is InputEventMouseButton and event.pressed == true and lama.direction == Vector2.ZERO:
		var spitInstance = spitScene.instantiate()
		add_child(spitInstance)
		spitInstance.global_position = lama.global_position
		spitInstance.launch(lama.get_global_mouse_position())
