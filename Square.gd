extends KinematicBody

export(NodePath) var rail
var speed = 20
var leap_distance = speed * 2

func _ready():
	translation.x = 0
	translation.z = 0
	snap_to_rail(get_node(rail))

func _process(delta):
	if Input.is_action_pressed("right"):
		move_and_collide(Vector3.RIGHT * speed * delta)
	
	if Input.is_action_just_pressed("right"):
		if !$LeapTimer.is_stopped():
			leap()
		else:
			$LeapTimer.start()

func leap():
	visible = false
	move_and_collide(Vector3.RIGHT * leap_distance)
	visible = true

func snap_to_rail(rail):
	translation.y = rail.translation.y
