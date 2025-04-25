extends Node3D

@onready var change_timer = $Timer

func _ready():
	change_timer.timeout.connect(_on_timeout)

func _on_timeout():
	get_tree().change_scene_to_file("res://cs_2.tscn")
