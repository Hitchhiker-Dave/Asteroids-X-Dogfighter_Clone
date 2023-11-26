extends Node2D

@onready var playspace_boundaries = $Playspace/Playspace_Boundaries

var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	screen_size = get_viewport_rect().size
	#playspace_boundaries.position = screen_size

func _on_playspace_body_exited(body):
	#Loop Screen; Only works if I use global_position for body
	#Horizontal Looping
	if body.global_position.x > screen_size.x:
		body.global_position.x = 0
	elif body.global_position.x < 0:
		body.global_position.x = screen_size.x
		
	#Vertical Looping
	if body.global_position.y > screen_size.y:
		body.global_position.y = 0
	elif body.global_position.y < 0:
		body.global_position.y = screen_size.y
