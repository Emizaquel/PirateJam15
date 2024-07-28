extends Polygon2D

var shadow_length_multiplier = 2.0
# Called when the node enters the scene tree for the first time.
func _ready():
	var h_width = $"..".width/2
	var l_height = ($"..".height + $"..".z_pos)*shadow_length_multiplier
	var l_z = $"..".z_pos*shadow_length_multiplier
	
	polygon = [
		Vector2(h_width, l_z),
		Vector2(-h_width, l_z),
		Vector2(-h_width, l_height),
		Vector2(h_width, l_height)
	]
	$Shadow/Shape.polygon = polygon
	queue_redraw()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	skew = PI*(0.5-Globals.daytime)
	pass
