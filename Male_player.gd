extends KinematicBody2D

var velocity = Vector2(0,0)
var citizens = 0
const SPEED = 30
const GRAVITY = 10
const JUMPFORSE = -250

func _physics_process(_delta):
	
	if Input.is_action_pressed("ui_right"):
		#if is_attacking == false || is_on_floor() == false:
		velocity.x = SPEED
		#if is_attacking == false:
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = false
			#if sign($Position2D.position.x) == -1:
				#$Position2D.position.x *= -1
				
	elif Input.is_action_pressed("ui_left"):
		#if is_attacking == false || is_on_floor() == false:
		velocity.x = -SPEED
		#if is_attacking == false:
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = true
			#if sign($Position2D.position.x) == 1:
				#$Position2D.position.x *= -1
		
	else:
		$AnimatedSprite.play("Idle")
	
	if not is_on_floor():
		$AnimatedSprite.play("fall")
		
	velocity.y = velocity.y + GRAVITY
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMPFORSE
		$Soundjump.play()

	velocity = move_and_slide(velocity,Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.2)
	
	
	

#func _on_fallzone_body_entered(body): #Connection
#	get_tree().change_scene("res://Menu/You_lose.tscn")

#func add_citizen():    no need & delete
#	citizens = citizens + 1


	
func bounce():
	velocity.y = JUMPFORSE * 0.7
	
func ouch(var Enemy2posx):
	set_modulate(Color(1,0.3,0.3,0.3))
	velocity.y = JUMPFORSE * 0.5
	
	if position.x < Enemy2posx:
		velocity.x = -450
	elif position.x > Enemy2posx:
		velocity.x = 450
		
	Input.action_release("left")
	Input.action_release("right")
	
	$Timer.start()

func _on_Timer_timeout():
	get_tree().change_scene("res://Menu/Stage_2_lose.tscn")

"""
var velocity = Vector2(0,0)
#var coins = 0
const SPEED = 30
const GRAVITY = 10
const JUMPFORSE = -250

func _physics_process(_delta):
	
	if Input.is_action_just_pressed("ui_right"):
		velocity.x = SPEED
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_just_pressed("ui_left"):
		velocity.x = -SPEED
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.play("Idle")
	
	if not is_on_floor():
		$AnimatedSprite.play("fall")
		
	velocity.y = velocity.y + GRAVITY
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMPFORSE

	velocity = move_and_slide(velocity,Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.2)
	

func _on_fallzone_body_entered(body): #Connection
	get_tree().change_scene("res://Level1.tscn")
	
func bounce():
	velocity.y = JUMPFORSE * 0.7
	
func ouch(var enemyposx):
	set_modulate(Color(1,0.3,0.3,0.3))
	velocity.y = JUMPFORSE * 0.5
	
	if position.x < enemyposx:
		velocity.x = -800
	elif position.x > enemyposx:
		velocity.x = 800
		
	Input.action_release("left")
	Input.action_release("right")
	
	$Timer.start()

func _on_Timer_timeout():
	get_tree().change_scene("res://Stagetwo.tscn")
"""

	
	
	



