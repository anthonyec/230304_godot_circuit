class_name Logic extends Node2D

@export var target: Node2D
@export var offset: Vector2
@export var props: Array[String] = []

func _ready() -> void:
	if not target:
		push_warning(self, " - No target set, using parent instead")
		target = get_parent()

	offset = global_position - target.global_position
