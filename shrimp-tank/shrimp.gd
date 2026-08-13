extends CharacterBody3D
var speed = 2
var target : Vector3 
var selfColour 
func _ready() -> void:
	target=self.global_position
	selfColour=$shrimp/Cube.get_surface_override_material(0).duplicate()
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

func changeColour(colour):
	selfColour.albedo_color = colour
	
