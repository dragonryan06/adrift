extends Label

@onready var label = self

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

var scale_val = 1.0
var scaleInc = true;
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if scaleInc:
		scale_val += 0.005
	else:
		scale_val -= 0.005
	if scale_val >= 1.1:
		scaleInc = false
	elif scale_val <= 1.0:
		scaleInc = true
		
	label.scale = Vector2(scale_val, scale_val)
