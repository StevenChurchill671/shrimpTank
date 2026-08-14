extends Node
var shrimp = preload("res://shrimp.tscn")

func _ready() -> void:
	var x = 10
	while x >0:
		var newShrimp = shrimp.instantiate()
		add_child(newShrimp)
		newShrimp.global_position = Vector3((x-5)*2,x,0)
		x-=1
