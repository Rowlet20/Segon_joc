extends KinematicBody2D

var velocitat_base = 0
var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 500
var falling = false

func _physics_process(delta):
	if falling == true:
		velocitat += gravetat * delta
		velocitat = move_and_slide(velocitat,Vector2.UP)
	
func _on_Area2D_body_entered(body):
	falling = true
