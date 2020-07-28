extends "res://Scripts/character.gd"

# Grounded?
var grounded = false 

# Jumping
var can_jump = false
var jump_time = 0
const TOP_JUMP_TIME = 0.1 # in seconds

# Apply force
func apply_force(state):
	# Move Left
	if Input.is_action_pressed("ui_left"):
		directional_force += DIRECTION.LEFT
	
	# Move Right
	if Input.is_action_pressed("ui_right"):
		directional_force += DIRECTION.RIGHT
	
	# Jump
	if Input.is_action_pressed("ui_select") && jump_time < TOP_JUMP_TIME && can_jump:
		directional_force += DIRECTION.UP
		jump_time += state.get_step()
	elif Input.is_action_just_released("ui_select"):
		can_jump = false # Prevents the player from jumping more than once while in air
	
	# While on the ground
	if grounded:
		can_jump = true
		jump_time = 0


# Enter Ground
func _on_ground_check_body_entered( body ):
	# Get groups
	var groups = body.get_groups()
	# If we are on a solid ground
	if groups.has("solid"):
		grounded = true


# Exit Ground
func _on_ground_check_body_exited( body ):
	# Get groups
	var groups = body.get_groups()
	# If we are on a solid ground
	if(groups.has("solid")):
		grounded = false

func _on_goal_area_entered( coll ):
	coll.get_parent().get("goal_line").set_hidden(true)
	coll.get_parent().get("goal_line_walked_back").set_hidden(false)
	coll.get_parent().get("goal_line_walked_front").set_hidden(false)
