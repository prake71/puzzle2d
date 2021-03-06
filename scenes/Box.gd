extends KinematicBody2D

onready var ray = $RayCast2D
var grid_size = 16

var inputs = { 
	'ui_up': Vector2.UP, 
	'ui_down' : Vector2.DOWN,
	'ui_left' : Vector2.LEFT,
	'ui_right' : Vector2.RIGHT }

func move(dir):
	var vector_pos = inputs[dir] * grid_size
	ray.cast_to = vector_pos
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += vector_pos
		return true
	return false
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



