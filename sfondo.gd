
extends Sprite

#Script per mantenere lo sfondo sotto la nave
#TODO: rename

var navetta = null

func _ready():
	navetta = get_parent().get_child(2)
	set_fixed_process(true)

func _fixed_process(delta):
	#print(navetta.get_pos())
	set_pos(navetta.get_pos())
	#print(get_parent().endPos)



