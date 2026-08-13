extends CharacterBody3D

var temporary
@onready
var camera = $Camera3D
@export var speed = 8.0 # Movement speed
var jumpHeight = 15
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	self.name = "player"
func  _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * .005)
		camera.rotate_x(-event.relative.y * .005)
		camera.rotation.x = clamp(camera.rotation.x, -PI/2, PI/2)
func _physics_process(delta):
	if $mouseCast3D.get_collider() != null:
		temporary = $mouseCast3D.get_collider()
		var here = temporary.get_parent().get_child(0).get_child(0).get_surface_override_material(0)
		here.albedo_color = Color(0.423, 0.0, 0.0, 1.0)
	var inputDirection = Input.get_vector("left", "right", "down", "up")
	var forward = -camera.global_transform.basis.z
	var right = camera.global_transform.basis.x
	var direction = (right * inputDirection.x + forward * inputDirection.y).normalized()
	if Input.is_action_pressed("jump"): 
		self.velocity.y = jumpHeight 
	
	# Normalize direction to prevent faster diagonal movement
	if direction != Vector3.ZERO :
		self.velocity.x = direction.x * speed
		self.velocity.z = direction.z * speed
		self.velocity.y = direction.y * speed
	else:
		self.velocity.x = move_toward(self.velocity.x, 0 , speed)
		self.velocity.z = move_toward(self.velocity.z, 0 , speed)
		self.velocity.y = move_toward(self.velocity.y, 0 , speed)
	
	
	move_and_slide()
