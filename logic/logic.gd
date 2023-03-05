class_name Logic extends Node2D

@export var target: RigidBody2D
@export var offset: Vector2
@export var props: Array[String] = []

func _ready() -> void:
	offset = global_position - target.global_position
