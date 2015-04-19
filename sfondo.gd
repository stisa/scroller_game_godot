
extends TextureFrame

#Script per mantenere lo sfondo sotto la nave

#NOTICE: THIS SCRIPT DOESN'T DO ANYTHING
# IT'S AN OLD VERSION

var navetta = null

func _ready():
	navetta = get_node("/root/Parent/Nave") # alternative: get_parent().get_child(2)
	#set_fixed_process(true)

func _fixed_process(delta):
	#print(navetta.get_pos())
	set_pos(navetta.get_pos())
	#print(get_parent().endPos)



