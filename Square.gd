extends KinematicBody

signal square_moved(translation)

var speed = 20
var leap_distance = speed * 2

func _process(delta):
	if Input.is_action_pressed("right"):
		move_and_collide(Vector3.RIGHT * speed * delta)
		emit_signal('square_moved', translation)
	
	if Input.is_action_just_pressed("right"):
		if !$LeapTimer.is_stopped():
			leap()
		else:
			$LeapTimer.start()

func leap():
	visible = false
	move_and_collide(Vector3.RIGHT * leap_distance)
	visible = true