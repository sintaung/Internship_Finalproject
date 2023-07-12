extends Control

var seconds=0
var minutes=0
var Dseconds=11
var Dminutes=0

func _ready():
	Reset_Timer()
	pass

func _on_Timer_timeout():
	if seconds==0:		
		if minutes>0:
			minutes-=1
			seconds=60
							
	seconds-=1
	if minutes==0 && seconds==0:
		get_tree().change_scene("res://Stagetwo.tscn")
			
		
			
	$Label.text=String(minutes)+":"+String(seconds) 
	pass
	
	
func Reset_Timer():
	seconds=Dseconds
	minutes=Dminutes


