extends KinematicBody

export(NodePath) var initial_rail
var rail
var speed = 20
var leap_distance = speed * 2
var last_direction

func _ready():
	rail = get_node(initial_rail)
	translation.x = 0
	translation.z = 0
	snap_to_rail(rail)

func _process(delta):
	if Input.is_action_just_pressed("right"):
		if last_direction == "right" && !$LeapTimer.is_stopped():
			leap(Vector3.RIGHT)
		else:
			$LeapTimer.start()

	if Input.is_action_just_pressed("left"):
		if last_direction == "left" && !$LeapTimer.is_stopped():
			leap(Vector3.LEFT)
		else:
			$LeapTimer.start()

	if Input.is_action_pressed("right"):
		last_direction = "right"
		move_and_collide(Vector3.RIGHT * speed * delta)
	elif Input.is_action_pressed("left"):
		last_direction = "left"
		move_and_collide(Vector3.LEFT * speed * delta)

	if Input.is_action_just_pressed("up"):
		var rail_above = rail.get_rail_above_at(translation)

		if rail_above:
			snap_to_rail(rail_above)
			rail = rail_above
	elif Input.is_action_just_pressed("down"):
		var rail_below = rail.get_rail_below_at(translation)

		if rail_below:
			snap_to_rail(rail_below)
			rail = rail_below

func leap(direction):
	$LeapTimer.stop()
	visible = false
	move_and_collide(direction * leap_distance)
	visible = true

func snap_to_rail(rail):
	translation.y = rail.translation.y
