extends TileMapLayer

# Called when the node enters the scene tree for the first time.
func generate():
	var n = randi_range(2,4)
	for i in n:
		for c in n:
			set_cell(Vector2i(i,c),0, Vector2i(0,0))
