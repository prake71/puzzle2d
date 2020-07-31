extends KinematicBody2D

onready var ray = $RayCast2D
var grid_size = 16

var inputs = { 
	'ui_up': Vector2.UP, 
	'ui_down' : Vector2.DOWN,
	'ui_left' : Vector2.LEFT,
	'ui_right' : Vector2.RIGHT }

func _unhandled_input(event):
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)
	if event.is_action_pressed("reset"):
		get_tree().reload_current_scene()

func move(dir):
	var game = get_parent()
	
	var vector_pos = inputs[dir] * grid_size
	ray.cast_to = vector_pos
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += vector_pos
		# increase number of moves
		game.moves += 1
		
	else:
		var collider = ray.get_collider()
		if collider.is_in_group('box'):
			if collider.move(dir):
				position += vector_pos
				# increase number of  moves
				game.moves += 1
				
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


