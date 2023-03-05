class_name TagSensor extends Logic

signal area_entered(area: Area2D)
signal area_exited(area: Area2D)

@onready var area_collision: Area2D = $Area2D
@onready var collision_shape: CollisionShape2D = $Area2D/CollisionShape2D
@onready var icon_active: Sprite2D = $IconActive

@export var radius: float = 100
@export var label: String = ""

var areas: Array[Area2D] = []

func _ready() -> void:
	super()
	area_collision.connect("area_entered", on_area_enter)
	area_collision.connect("area_exited", on_area_exit)
	
func _physics_process(_delta: float) -> void:
	collision_shape.shape.radius = radius
	
	if not areas.is_empty():
		activate()
	else:
		deactivate()

func activate() -> void:
	icon_active.visible = true

func deactivate() -> void:
	icon_active.visible = false

func on_area_enter(area: Area2D) -> void:
	if area.is_in_group("tag"):
		if area.label == label:
			areas.append(area)
			area_entered.emit(area)
		
func on_area_exit(area: Area2D) -> void:
	if area.is_in_group("tag"):
		if area.label == label:
			var index = areas.find(area)
			areas.remove_at(index)
			area_exited.emit(area)
