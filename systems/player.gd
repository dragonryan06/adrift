extends CharacterBody2D

@export var HEAD_TURN_SPEED = 0.5
@export var MOVE_SPEED = 250

var parent_grid = null

func _physics_process(delta:float) -> void:
	var angle = global_position.angle_to_point(get_global_mouse_position())+PI/2.0
	rotation = lerp_angle(rotation,angle,HEAD_TURN_SPEED)
	# This is so the camera can rotated independently of its parent
	$Pivot.rotation = -rotation
	
	var movement = Vector2(Input.get_axis("move_left","move_right"), Input.get_axis("move_up","move_down"))
	
	if movement.x:
		velocity.x = movement.x*MOVE_SPEED
	elif is_instance_valid(parent_grid):
		velocity.x = move_toward(velocity.x, 0, MOVE_SPEED)
	if movement.y:
		velocity.y = movement.y*MOVE_SPEED
	elif is_instance_valid(parent_grid):
		velocity.y = move_toward(velocity.y, 0, MOVE_SPEED)
	move_and_slide()
	
	parent_grid = $GridDetector.get_collider()
