extends Control

var seconds=0
var minutes=0
var Dseconds=00
var Dminutes=2

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
		get_tree().change_scene("res://Menu/Stage_2_lose.tscn")
			
		
			
	$Label.text=String(minutes)+":"+String(seconds) 
	pass
	
	
func Reset_Timer():
	seconds=Dseconds
	minutes=Dminutes	
	
			
			



""""


if minutes>0:
		if seconds==0:
			minutes-=1
			seconds=60
		
	minutes>0







var seconds=30
var minutes=1


func _ready():	
	
	if seconds==0:
		if minutes>0:
			minutes-=1
			seconds=30
	seconds-=1	
	
	$Label.text=String(minutes)+":"+String(seconds)
	
	pass
	#Reset_Timer()
	pass

#var Dseconds=30
#var Dminutes=1

func _on_Timer_timeout():	

	get_tree().change_scene("res://Stagetwo.tscn")
	
	
	
	
#func Reset_Timer():
#	seconds=Dseconds
#	minutes=Dminutes


"""
