extends CanvasLayer

var citizens = 0

func _ready():
	$citizensNo.text = String(citizens)
	if citizens == 3:
		yield(get_tree().create_timer(1.5), "timeout")
		get_tree().change_scene("res://Menu/You_win.tscn")

#func _physics_process(_delta):
	
		
		#get_tree().paused=true	
		
		#get_tree().change_scene("res://Menu/You_win.tscn")


func _on_citizen_saved():
	citizens = citizens + 1
	_ready()

