
extends StaticBody2D

# Script per mantere il bordo allineato con la nave

var navetta = null
var yBordo = null
var xNavetta = null

func _ready():
	navetta = get_parent().get_child(3)
	set_fixed_process(true)

func _fixed_process(delta):
	xNavetta = navetta.get_pos().x
	yBordo = get_pos().y
	set_pos(Vector2(xNavetta,yBordo))


