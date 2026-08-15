extends CharacterBody3D

var food = preload("res://food_for_shrimp.tscn")
var feederNode = preload("res://feeder_node.tscn")
var temporary
var feeder
var menuOpen = false
@onready
var leftPosition = $"../playHolderThree"
@onready
var rightPosition = $"../playHolderTwo"
@onready
var frontPosition = $"../playholder"
@onready
var isBack = false
@onready
var camera = $Camera3D
@export var speed = 8.0 # Movement speed
var jumpHeight = 15
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	self.name = "player"
func  _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion && !menuOpen:
		rotate_y(-event.relative.x * .005)
		camera.rotate_x(-event.relative.y * .005)
		camera.rotation.x = clamp(camera.rotation.x, -PI/2, PI/2)
		$mouseCast3D.rotation.x = clamp(camera.rotation.x, -PI/2, PI/2)
func _physics_process(delta):
	if Input.is_action_just_pressed("openMenu"):
		if menuOpen == true:
			menuOpen = false
			if feeder!= null:
				feeder.queue_free()
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		else:
			menuOpen = true
			self.rotation = Vector3(0,0,0)
			self.global_position = $"../playholder".global_position
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if $mouseCast3D.get_collider() != null && $mouseCast3D.get_collider().has_meta("shrimp"):
		temporary = $mouseCast3D.get_collider()
		var here = temporary.get_parent()
		here.changeColour(Color(1.0, 0.0, 0.0, 1.0))
	var inputDirection = Input.get_vector("left", "right", "down", "up")
	var forward = -camera.global_transform.basis.z
	var right = camera.global_transform.basis.x
	var direction = (right * inputDirection.x + forward * inputDirection.y).normalized()
	if menuOpen:
		if Input.is_action_pressed("left"): 
			if feeder!= null:
				feeder.global_position += Vector3(-0.2,0,0)
			if feeder == null:
				self.global_position = $"../playHolderThree".global_position
				self.rotation_degrees = Vector3 (0,-90,0)
		if Input.is_action_pressed("right"): 
			if feeder!= null:
				feeder.global_position += Vector3(0.2,0,0)
			if feeder == null:
				self.global_position = $"../playHolderTwo".global_position
				self.rotation_degrees = Vector3 (0,90,0)
		if Input.is_action_pressed("up"): 
			if feeder!= null:
				feeder.global_position += Vector3(0,0,-0.2)
			if feeder == null:
				self.global_position = $"../playHolderFour".global_position
				self.rotation_degrees = Vector3 (0,180,0)
		if Input.is_action_pressed("down"): 
			if feeder!= null:
				feeder.global_position += Vector3(0,0,0.2)
			if feeder == null:
				self.global_position = $"../playholder".global_position
				self.rotation_degrees = Vector3 (0,0,0)
	if Input.is_action_pressed("jump"): 
		self.velocity.y = jumpHeight 
	
	# Normalize direction to prevent faster diagonal movement
	if direction != Vector3.ZERO && !menuOpen :
		self.velocity.x = direction.x * speed
		self.velocity.z = direction.z * speed
		self.velocity.y = direction.y * speed
	else:
		self.velocity.x = move_toward(self.velocity.x, 0 , speed)
		self.velocity.z = move_toward(self.velocity.z, 0 , speed)
		self.velocity.y = move_toward(self.velocity.y, 0 , speed)
	
	
	move_and_slide()


func _on_feed_button_pressed() -> void:
	if feeder==null:
		feeder = feederNode.instantiate()
		get_parent().add_child(feeder)
		feeder.global_position=Vector3(0,15,5)
	var myFood = food.instantiate()
	get_parent().add_child(myFood)
	myFood.global_position = feeder.global_position
