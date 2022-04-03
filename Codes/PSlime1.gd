extends KinematicBody2D

var velocitat_base = 300
var velocitat = Vector2.ZERO
var direccio = false

func _physics_process(delta):
	velocitat.x
	if direccio == false:
		velocitat = Vector2.LEFT * velocitat_base
		if position.x <= 1250:
			direccio = true
	elif direccio == true:
		velocitat = Vector2.RIGHT * velocitat_base
		if position.x >= 1600:
			direccio = false
	
	velocitat = move_and_slide(velocitat, Vector2.UP)
	
	anima(velocitat)
	
func anima(velocitat:Vector2):
	var animacio = $AnimatedSprite
	if velocitat.x < 0:
		animacio.flip_h = false
		animacio.play('Walking')
	elif velocitat.x > 0:
		animacio.flip_h = true
		animacio.play('Walking')


func _on_Area_bromita_body_entered(body):
	pass # Replace with function body.
