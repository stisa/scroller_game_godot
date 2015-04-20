
extends StaticBody2D

# This script keeps the border Y axis aligned with the ship's

var navetta = null 								# ship
var yBordo = null								# y coordinate of the border
var xNavetta = null								# x coordinate of the ship

func _ready():
	navetta = get_node("/root/Parent/Nave") 
	set_fixed_process(true)

func _fixed_process(delta):
	xNavetta = navetta.get_pos().x
	yBordo = get_pos().y
	self.set_pos(Vector2(xNavetta,yBordo)) 		# set the border pos


