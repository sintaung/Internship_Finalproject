extends Button

func _ready():
	pass
	
func _on_Back_menu_pressed():
	get_tree().change_scene("res://Menu/Real_Menu.tscn")
