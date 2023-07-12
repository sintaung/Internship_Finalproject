extends KinematicBody2D

var speed = 50
var velocity = Vector2()
export var direction = -1
export var detects_cliffs = true
export(Vector2) var size = Vector2(1, 1)

func _ready():
	scale = size 
	pass
	
	if direction == 1:
		$AnimatedSprite.flip_h = true
	$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction	
	$floor_checker.enabled = detects_cliffs
	if detects_cliffs:
		set_modulate(Color(1.3,0.7,1))

func _physics_process(_delta):
	
	if is_on_wall() or not $floor_checker.is_colliding() and detects_cliffs and is_on_floor():
		direction = direction * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction	
	
	velocity.y += 20
	
	velocity.x = speed * direction
		
	velocity = move_and_slide(velocity,Vector2.UP)


func _on_top_checker_body_entered(_body):
	$AnimatedSprite.play("squash")
	speed = 0
	set_collision_layer_bit(4,false)
	set_collision_mask_bit(0,false)
	$top_checker.set_collision_layer_bit(4,false)
	$top_checker.set_collision_mask_bit(0,false)
	$side_checker.set_collision_layer_bit(4,false)
	$side_checker.set_collision_mask_bit(0,false)
	$Timer.start()
	_body.bounce()
	$Soundsquash.play()
	

func _on_side_checker_body_entered(body):
	print("ouch!")
	#get_tree().change_scene("res://Menu/You_lose.tscn")
	body.ouch(position.x)


func _on_Timer_timeout():
	queue_free()















"""extends KinematicBody2D

var speed = 50
#var velocity = Vector2()
export var direction = -1
export var detects_cliffs = true
export(Vector2) var size = Vector2(1, 1)

#func _ready():
	scale = size 
	#pass
	
	if direction == 1:
		$AnimatedSprite.flip_h = true
	$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction	
	$floor_checker.enabled = detects_cliffs
	if detects_cliffs:
		set_modulate(Color(1.2,0.5,1))

#func _physics_process(_delta):
	
	if is_on_wall() or not $floor_checker.is_colliding() and detects_cliffs and is_on_floor():
		direction = direction * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction	
	
	#velocity.y += 20
	
	velocity.x = speed * direction
		
	#velocity = move_and_slide(velocity,Vector2.UP)


func _on_top_checker_body_entered(_body):
	$AnimatedSprite.play("squash")
	speed = 0
	set_collision_layer_bit(1,false)
	set_collision_mask_bit(2,false)
	$top_checker.set_collision_layer_bit(1,false)
	$top_checker.set_collision_mask_bit(2,false)
	$side_checker.set_collision_layer_bit(1,false)
	$side_checker.set_collision_mask_bit(2,false)
	$Timer.start()
	_body.bounce()

func _on_side_checker_body_entered(body):
	print("ouch!")
	get_tree().change_scene("res://Stagetwo.tscn")
	body.ouch(position.x)


func _on_Timer_timeout():
	queue_free()"""





























