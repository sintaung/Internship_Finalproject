extends Node


func _ready():
	$MarginContainer/VBoxContainer/VBoxContainer/TextureButton.grab_focus()
	
func _physics_process(_delta):
	if $MarginContainer/VBoxContainer/VBoxContainer/TextureButton.is_hovered() == true:
		$MarginContainer/VBoxContainer/VBoxContainer/TextureButton.grab_focus()		
	if $MarginContainer/VBoxContainer/VBoxContainer/TextureButton2.is_hovered() == true:
		$MarginContainer/VBoxContainer/VBoxContainer/TextureButton2.grab_focus()		


func _on_TextureButton_pressed():
	get_tree().change_scene("res://Stageone.tscn") # Error Yellow The function 'change_scene()' returns a value, but this value is never used.

func _on_TextureButton2_pressed():
	get_tree().quit()
