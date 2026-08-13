extends CharacterBody3D

func _process(delta: float) -> void:
	if Input.is_action_pressed("A"):
		self.global_position += Vector3(-0.2,0,0)
	if Input.is_action_pressed("S"):
		self.global_position += Vector3(0,-0.2,0)
	if Input.is_action_pressed("D"):
		self.global_position += Vector3(0.2,0,0)
	if Input.is_action_pressed("W"):
		self.global_position += Vector3(0,0.2,0)
