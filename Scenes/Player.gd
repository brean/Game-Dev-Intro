extends KinematicBody2D

const UP = Vector2(0, -1)
const SLOPE_STOP = 64

var velocity = Vector2()
var snap = Vector2(10, 10)
var move_speed = 500
var gravity = 1200

func _physics_process(delta):
	_get_input()
	# velocity.y += gravity * delta
	velocity = move_and_slide_with_snap(velocity, snap, UP)
	
func _get_input():
	var move_direction = -int(Input.is_action_pressed("move_left"))
	move_direction += int(Input.is_action_pressed("move_right"))
	velocity.x = lerp(velocity.x, move_speed * move_direction, .2)
	if move_direction != 0:
		$Body.scale.x = move_direction