extends Polygon2D

var shadow_length_multiplier = 2.0

# Called when the node enters the scene tree for the first time.
func _ready():
	var h_depth = $"..".depth/2
	var l_height = ($"..".height + $"..".z_pos)*shadow_length_multiplier
	var l_z = ($"..".z_pos)*shadow_length_multiplier
	polygon = [
		Vector2(l_z, h_depth),
		Vector2(l_z, -h_depth),
		Vector2(l_height, -h_depth),
		Vector2(l_height, h_depth)
	]
	$Shadow/Shape.polygon = polygon
	queue_redraw()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	skew = ((Globals.daytime))*PI
	rotation = (1-Globals.daytime)*PI
	pass
