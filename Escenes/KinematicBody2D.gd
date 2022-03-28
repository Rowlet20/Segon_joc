extends Area2D

var velocitat = Vector2.ZERO
var gravetat = Vector2.DOWN * 980 #Si cada 100 pixels es un metre
var falling = false

func _physics_process(delta):
	if falling == true:
		position += Vector2(0,1)
	
func _on_Area2D_body_entered(body):
	falling = true
