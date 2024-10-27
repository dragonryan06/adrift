extends Node

var world = preload("res://scenes/world.tscn")

func _on_button_pressed() -> void:
	var mm = $"Main Menu"
	remove_child(mm)
	mm.queue_free()
	
	add_child(world.instantiate())
