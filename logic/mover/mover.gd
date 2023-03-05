class_name Mover extends Logic

@export var is_local: bool = false 
@export var force: Vector2

func _physics_process(_delta: float) -> void:
	var force_to_apply = force
	
	if is_local:
		force_to_apply = force.rotated(target.global_rotation)
	
	target.apply_force(force_to_apply, offset)
