extends CharacterBody3D
var speed = 2
var target : Vector3 

func _ready() -> void:
	target=self.global_position
func _process(delta: float) -> void:
	if !is_inside_tree():
		return
	newBehave()
	newBehave()
	newBehave()
	velocity = global_position.direction_to(target) * speed
	move_and_slide()
func movePlusX():
	target += Vector3(1,0,0)
func movePlusY():
	target += Vector3(0,1,0)
func movePlusZ():
	target += Vector3(0,0,1)
func moveMinusX():
	target += Vector3(-1,0,0)
func moveMinusY():
	target += Vector3(0,-1,0)
func moveMinusZ():
	target += Vector3(0,0,-1)
func moveAwayFromOthers():
	pass
func newBehave():
	var newNumb = randi_range(0,5)
	if newNumb == 0:
		movePlusX()
	if newNumb == 1:
		movePlusY()
	if newNumb == 2:
		movePlusZ()
	if newNumb == 3:
		moveMinusX()
	if newNumb == 4:
		moveMinusY()
	if newNumb == 5:
		moveMinusZ()





func _on_area_3d_mouse_entered() -> void:
	var myMaterial = $shrimp/Cube.get_surface_override_material()
	myMaterial.albedo_color = Color(0.965, 0.0, 0.0, 1.0)
	
