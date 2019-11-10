extends Spatial

export var dust_speed = 10

func _process(delta):
	$Dust1.translation.x -= dust_speed * delta
	$Dust2.translation.x -= dust_speed * delta
	$Dust3.translation.x -= dust_speed * delta