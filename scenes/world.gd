extends Node

@onready var Asteroid = preload("res://entities/asteroid.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for n in 5:
		var a = Asteroid.instantiate()
		add_child(a)
		a.generate()
		a.position = Vector2((randi_range(-200,200)), randi_range(-200,200))
		#get_child(n).rotate(randf_range(-90,90))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
