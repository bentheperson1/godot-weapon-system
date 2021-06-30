extends Area2D

var direction : Vector2 = Vector2.LEFT # default direction
var speed : float = 400 #put your rocket speed

func _process(delta):
	translate(direction*speed*delta)
