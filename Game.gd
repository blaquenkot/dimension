extends Spatial

func _on_square_moved(translation):
	$Particles.translation = translation * 0.98
