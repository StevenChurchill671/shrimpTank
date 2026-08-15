extends Node


func _on_floor_border_body_entered(body: Node3D) -> void:
	if body.has_meta("shrimp"):
		body.changeWeights(1, 1)


func _on_sky_border_body_entered(body: Node3D) -> void:
	if body.has_meta("shrimp"):
		body.changeWeights(1, 0)
