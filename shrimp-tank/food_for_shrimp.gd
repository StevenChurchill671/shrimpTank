extends Node3D

func _process(delta: float) -> void:
	self.global_position -= Vector3(0,0.01,0)


func _on_eat_area_area_entered(area: Area3D) -> void:
	if area.has_meta("shrimp"):
		queue_free()


func _on_discover_area_area_entered(area: Area3D) -> void:
	if area.has_meta("shrimp"):
		area.get_parent().findFood(self)
