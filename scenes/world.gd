extends Node

const asteroid_count = 100

@onready var Asteroid = preload("res://entities/asteroid.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# make a bunch of bounding boxes
	for a in asteroid_count:
		var area = Area2D.new()
		area.position = Vector2(randi_range(-5000,5000),randi_range(-5000,5000))
		area.rotation = randf_range(0,-PI)
		var collider = CollisionShape2D.new()
		var shape = RectangleShape2D.new()
		var size = randf_range(100.0,800.0)
		shape.size = Vector2(size,size)
		collider.shape = shape
		area.add_child(collider)
		$Asteroids.add_child(area)
	
	# kill overlapping bounding boxes
	for c:Area2D in $Asteroids.get_children():
		if len(c.get_overlapping_areas()) > 0:
			$Asteroids.remove_child(c)
			c.queue_free()
	
	# generate asteroids in these locations
	for c in $Asteroids.get_children():
		if c is Area2D:
			var a = Asteroid.instantiate()
			$Asteroids.add_child(a)
			a.position = c.position
			a.rotation = c.rotation
			a.generate()
			
			$Asteroids.remove_child(c)
			c.queue_free()
