extends RigidBody2D

#Port all these variables into a Custom Resource Doc for importing
var direction := Vector2.ZERO
var input := Vector2.ZERO
var turning_speed := 250
var thrust_speed := 20000
var friction := 1 * 10^(-7)
var max_speed := 1000.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(position)
	
	#Get Inputs
	input.x = Input.get_axis("turn_left", "turn_right")
	input.y = Input.get_action_strength("move_forward") * -1
	
	#Rotate
	if Input.is_action_pressed("turn_left") or Input.is_action_pressed("turn_right"):
		apply_torque(input.x * turning_speed * delta)
	
	# Direction = < rcos , rsin >?
	direction = Vector2(
		cos(rotation), sin(rotation)
	).normalized()

	#Move forward towards a given direction
	if Input.is_action_pressed("move_forward") and linear_velocity.length() < max_speed:
		apply_central_force(direction * thrust_speed * delta)
	elif linear_velocity.length() < 15:
		linear_velocity = Vector2.ZERO
		apply_central_force(direction * thrust_speed * delta * 0.0)
	else:
		apply_central_force(direction * thrust_speed * delta * 0.00000000000001)
