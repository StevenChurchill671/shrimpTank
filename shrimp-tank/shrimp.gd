extends CharacterBody3D
var speed = 2
var target : Vector3 
var selfColour 
var foodDiscovered = false
var foodItself 
var shrimpName = "Shrimp"
var noMove = false
var localMesh
var age = 0
var sizeMax =0
func _ready() -> void:
	target=self.global_position
	selfColour=$shrimp/Cube.get_surface_override_material(0).duplicate()
	$shrimp/Cube.set_surface_override_material(0, selfColour)
func _process(delta: float) -> void:
	if !is_inside_tree():
		return
	if noMove:
		return
	if foodDiscovered && foodItself!=null:
		target = foodItself.global_position
		velocity = global_position.direction_to(target) * speed
		move_and_slide()
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
	var newNumb = randi_range(0,120)
	if newNumb <= yWeight:
		movePlusY()
	if newNumb <= 40 && newNumb > yWeight:
		moveMinusY()
	if newNumb <= xWeight && newNumb > 40:
		movePlusX()
	if newNumb <= 80 && newNumb > xWeight:
		moveMinusX()
	if newNumb <= zWeight && newNumb > 80:
		movePlusZ()
	if newNumb <= 120 && newNumb > zWeight:
		moveMinusZ()

func changeColour(colour):
	selfColour.albedo_color = colour
	
func findFood(food):
	target = food.global_position
	foodDiscovered = true
	foodItself = food
var yWeight = 20
var xWeight = 60
var zWeight = 100
func changeWeights(xyz, posOrNeg): 
	if posOrNeg == 1:
		if xyz == 1:
			yWeight = 25
		if xyz == 0:
			xWeight = 70
		if xyz == 2:
			zWeight = 110
	if posOrNeg == 0:
		if xyz == 1:
			yWeight = 5
		if xyz == 0:
			xWeight = 50
		if xyz == 2:
			zWeight = 90

func makeNameVisible():
	if localMesh ==null:
		localMesh = MeshInstance3D.new()
		localMesh.mesh = TextMesh.new()
		add_child(localMesh)
		localMesh.position = Vector3(0,2,0)
		localMesh.mesh.text = str(shrimpName)
		localMesh.scale = Vector3(2,2,2)
		$nameTimeout.start()


func _on_name_timeout_timeout() -> void:
	if localMesh!=null:
		localMesh.queue_free()
