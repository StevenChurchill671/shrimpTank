extends Node
var shrimp = preload("res://shrimp.tscn")

func _ready() -> void:
	var x = 10
	while x >0:
		var newShrimp = shrimp.instantiate()
		add_child(newShrimp)
		x-=1
