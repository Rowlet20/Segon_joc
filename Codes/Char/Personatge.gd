extends KinematicBody2D

var velocitat_base = 300
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 980 #Si cada 100 pixels es un metre
var salt = Vector2.UP * 500
var doble_salt = 1

func _physics_process(delta):
	velocitat.x = 0
	if Input.is_action_pressed("right"):
		velocitat += Vector2.RIGHT * velocitat_base
	if Input.is_action_pressed("left"):
		velocitat += Vector2.LEFT * velocitat_base
	if Input.is_action_just_pressed("up") and doble_salt != 0:
		doble_salt -= 1
		velocitat = salt
		if doble_salt == 0:
			modulate = Color(255,1,1)
	if is_on_floor():
		doble_salt = 1
		modulate = Color(1,1,1)
	if Input.is_action_pressed("return"):
		position = Vector2(503,199)
		
	velocitat += gravetat * delta
	velocitat = move_and_slide(velocitat, Vector2.UP)
	
	anima(velocitat)
	
func anima(velocitat:Vector2):
	var animacio = $AnimatedSprite
	if velocitat.x > 0:
		animacio.flip_h = false
		animacio.play('Walkin')
	elif velocitat.x < 0:
		animacio.flip_h = true
		animacio.play('Walkin')
		
	if velocitat.y < -2:
		animacio.play('Jump')
		return
		
	if velocitat.y > 1:
		animacio.play('Fall')
		return
		
	if abs(velocitat.x) < 0.1:
		animacio.play('Quiet')
		

func _on_Play_body_entered(body):
	get_tree().change_scene("res://Escenes/Nivell 1/Nivell 1.tscn")


func _on_Nivell_2_body_entered(body):
	get_tree().change_scene("res://Escenes/Nivell 2/Nivell 2.tscn")


func _on_Area2D_body_entered(body):
	if position.y >= 2045:
		position = Vector2(503,199)

#Enemics-----------------------------------------------------------------------

func _on_Area_PSlime_body_entered(body):
	position = Vector2(503,199)


func _on_Bee_Area_body_entered(body):
	position = Vector2(503,199)
#------------------------------------------------------------------------------

func _on_Final_body_entered(body):
	get_tree().change_scene("res://Escenes/Final/Final.tscn")


func _on_Return_body_entered(body):
	if position.y >= 1720.5:
		position = Vector2(503,199)

func _on_ReturnW_body_entered(body):
	if position.x >= 0:
		position = Vector2(503,199)

func _on_ReturnW2_body_entered(body):
	if position.x >= 8927:
		position = Vector2(503,199)
