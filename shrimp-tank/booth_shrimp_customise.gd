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
	
