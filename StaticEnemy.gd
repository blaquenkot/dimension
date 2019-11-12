extends StaticBody

var player = null

func _on_Area_body_entered(body):
	if body.name == 'Square':
		player = body
		$ColorTimer.start()

func _on_Area_body_exited(body):
	if body.name == 'Square':
		player = null
		$ColorTimer.stop()

func _on_ColorTimer_timeout():
	if player:
		var progress = (player.translation/translation).x # Improve this.
		$MeshInstance.mesh.material.set_shader_param("progress", progress)