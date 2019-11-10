extends StaticBody

func get_rail_above_at(position):
	$RayCastUp.translation.x = to_local(position).x
	$RayCastUp.force_raycast_update()
	return $RayCastUp.get_collider()

func get_rail_below_at(position):
	$RayCastDown.translation.x = to_local(position).x
	$RayCastDown.force_raycast_update()
	return $RayCastDown.get_collider()