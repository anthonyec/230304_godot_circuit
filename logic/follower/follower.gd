class_name Follower extends Logic

@onready var tag_sensor: TagSensor = $TagSensor as TagSensor

@export var label: String = ""

var areas: Array[Area2D] = []

func _ready() -> void:
	tag_sensor.target = target
	tag_sensor.label = label

func _physics_process(delta: float) -> void:
	if not areas.is_empty():
		target.global_position = areas[0].global_position - offset

func _on_tag_sensor_area_entered(area) -> void:
	areas.append(area)


func _on_tag_sensor_area_exited(area) -> void:
	var index = areas.find(area)
	areas.remove_at(index)
