extends Area2D

signal citizen_saved 

func _on_Our_Citizen_body_entered(body):
	
	$AnimationPlayer.play("bounce")
	emit_signal("citizen_saved")
	set_collision_mask_bit(0,false)
	$Thankyou.play()

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
