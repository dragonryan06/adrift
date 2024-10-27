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
	
	if (is_instance_valid(parent_grid) or len($WallDetector.get_overlapping_bodies())>1) and movement.x:
		velocity.x = movement.x*MOVE_SPEED
	elif is_instance_valid(parent_grid):
		velocity.x = move_toward(velocity.x, 0, MOVE_SPEED)
	if (is_instance_valid(parent_grid) or len($WallDetector.get_overlapping_bodies())>1) and movement.y:
		velocity.y = movement.y*MOVE_SPEED
	elif is_instance_valid(parent_grid):
		velocity.y = move_toward(velocity.y, 0, MOVE_SPEED)
	move_and_slide()
	
	parent_grid = $GridDetector.get_collider()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton && event.button_index == MOUSE_BUTTON_LEFT && event.is_pressed():
		var coor = get_parent().get_node("Asteroids").local_to_map(get_global_mouse_position()+abs(get_parent().get_node("Asteroids").position))
		var id = get_parent().get_node("Asteroids/Damage").get_cell_source_id(coor)
		if get_parent().get_node("Asteroids/AsteroidWalls").get_cell_source_id(coor) != -1:
			if id < 1:
				get_parent().get_node("Asteroids/Damage").set_cell(coor, id+1, Vector2i(0,0))
			else:
				get_parent().get_node("Asteroids/AsteroidWalls").set_cell(coor, -1)
				get_parent().get_node("Asteroids/Damage").set_cell(coor, -1)
				
