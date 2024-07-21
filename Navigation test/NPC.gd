extends CharacterBody2D

@export var player:CharacterBody2D
@onready var navigator = $NavigationAgent2D
@export var destinations:Array[Vector2]

var pathing = true
var current_dest

func _ready():
	if(destinations.size() > 0):
		current_dest = destinations.pop_front()
		navigator.target_position = current_dest
	else:
		pathing = false

func _physics_process(_delta):
	if(pathing):
		Navigate()
	else:
		velocity = velocity.lerp(Vector2.ZERO, 0.1)
	move_and_collide(velocity)

func Navigate():
	if(navigator.is_target_reached()):
		if(destinations.size() > 0):
			current_dest = destinations.pop_front()
			navigator.target_position = current_dest
		else:
			pathing = false
	else:
		var heading = navigator.get_next_path_position() - global_position
		heading = heading.normalized()
		velocity = velocity.lerp(heading, 0.1)
		Direction_From_Heading(velocity)
		Face_Direction()

func Direction_From_Heading(velocity):
	var heading = velocity.angle()
	if(abs(heading) < (PI*0.25) ):
		direction = 3
		return
	if(abs(heading) > (PI*0.75) ):
		direction = 1
		return
	if(heading > 0):
		direction = 2
		return
	direction = 0

var direction = 0

func Detect_Player():
	var pdel = player.position - position
	$RayCast2D.target_position = pdel.normalized()*100
	if($RayCast2D.is_colliding()):
		if($RayCast2D.get_collider() == player):
			if(abs(pdel.y) > abs(pdel.x)):
				if(pdel.y > 0):
					if(direction == 2):
						$Label.visible = true
						return
				else:
					if(direction == 0):
						$Label.visible = true
						return
			else:
				if (pdel.x < 0):
					if(direction == 1):
						$Label.visible = true
						return
				else:
					if(direction == 3):
						$Label.visible = true
						return
	$Label.visible = false

var hunting = false

func _process(_delta):
	Detect_Player()
	if($Label.visible):
		navigator.target_position = player.global_position
		pathing = true
		hunting = true
	else:
		if(hunting):
			navigator.target_position = current_dest
			hunting = false

func Face_Direction():
	$Sprite.region_rect = Rect2(0,32*direction,32,32)

func _on_turn_timeout():
	if(!pathing):
		direction = (direction+1)%4
		Face_Direction()
	pass # Replace with function body.
