extends KinematicBody2D

var velocitat_base = 1000
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 98000
var gravetat_bool = false
var direccio = false
var bromita = false

func _physics_process(delta):
	velocitat.x
	if bromita == true:
		velocitat = Vector2.LEFT * velocitat_base
		if position.x <= 1250:
			direccio = true
	if position.x <= 3750:
		gravetat_bool = true
	if gravetat_bool == true:
		velocitat += gravetat * delta
		
	velocitat = move_and_slide(velocitat, Vector2.UP)
	
	anima(velocitat)
	
func anima(velocitat:Vector2):
	var animacio = $AnimatedSprite
	animacio.flip_h = false
	animacio.play('Walking')

	
func _on_Area_bromita_body_entered(body):
	bromita = true

