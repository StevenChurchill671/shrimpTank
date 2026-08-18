extends HBoxContainer
var newShrimpName
var shrimpInQuestion
func changeShrimpNameFirst(shrimp):
	$VBoxContainer/HBoxContainer/nameBox.text = shrimp.shrimpName
	assignShrimp(shrimp)
func assignShrimp(shrimp):
	shrimpInQuestion = shrimp
func changeShrimpNameNew():
	shrimpInQuestion.shrimpName = $VBoxContainer/HBoxContainer/nameBox.text
	


func _on_exit_pressed() -> void:
	get_parent().get_parent().exitShrimpBooth()
	shrimpInQuestion.global_position = Vector3(2,4,5)
	shrimpInQuestion.noMove = false
