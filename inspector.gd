class_name Inspector extends Node2D

@onready var mover: Logic = $"../RigidBody2D/Mover" as Logic

func _ready() -> void:
	var logic_props = mover.props
	var property_list = mover.get_property_list().filter(func (property):
		var index = logic_props.find(property.name)
		return index != -1
	)
	
	print(property_list)
	
func _process(_delta: float) -> void:
	pass
