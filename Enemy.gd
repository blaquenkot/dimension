extends KinematicBody

onready var initial_translation = self.translation

var speed = 10
var direction = Vector3.LEFT

func _process(delta):
	var diff = floor((initial_translation.x / self.translation.x) * 100)

	if diff == 90:
		direction = Vector3.LEFT
	elif diff == 100:
		direction = Vector3.RIGHT
		
	move_and_collide(direction * speed * delta)