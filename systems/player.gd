extends CharacterBody2D

@export var HEAD_TURN_SPEED = 0.5
@export var MOVE_SPEED = 250

func _physics_process(delta:float) -> void:
	var angle = global_position.angle_to_point(get_global_mouse_position())+PI/2.0
	rotation = lerp_angle(rotation,angle,HEAD_TURN_SPEED)
	
	var horizontal = Input.get_axis("move_left","move_right")
	var vertical = Input.get_axis("move_up","move_down")
	if horizontal:
		velocity.x = horizontal*MOVE_SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, MOVE_SPEED)
	if vertical:
		velocity.y = vertical*MOVE_SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, MOVE_SPEED)
	move_and_slide()
