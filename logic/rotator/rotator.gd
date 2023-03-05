class_name Rotator extends Logic

@export var torque: float

func _physics_process(_delta: float) -> void:
	target.apply_torque(torque)
