extends Node

func _ready() -> void:
	var noise = FastNoiseLite.new()
	noise.seed = randi()
	noise.noise_type = FastNoiseLite.TYPE_SIMPLEX_SMOOTH
	noise.frequency = 0.2
	noise.fractal_octaves = 1
	noise.fractal_gain = 1
	
	for x in 1024:
		for y in 1024:
			var sample = noise.get_noise_2d(x,y)
			if sample > 0.25:
				$Asteroids.set_cell(Vector2i(x,y),0,Vector2i(0,0))
				$Asteroids/AsteroidWalls.set_cell(Vector2i(x,y),0,Vector2i(1,0))
