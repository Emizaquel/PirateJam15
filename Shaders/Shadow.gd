extends Area2D

@onready var collider = $CollisionPolygon2D
@onready var polygon = $Polygon2D

@export var verticies:Array[Vector2] = []

# Called when the node enters the scene tree for the first time.
func _ready():
	collider.polygon = verticies
	polygon.polygon = verticies


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
