
extends Label

var root = null
var distance = null

func _ready():
	self.hide() 					# Hide label
	root = get_node("/root/Parent/")
	
func _process(delta):
	distance = get_node("/root/Parent/").endPos/100 # divide by 100 to get a more reasonable number
	self.set_text("Game Over\n\n"+"Traveled:\n"+str(floor(distance))+"m") 		# Change label text
	self.show() 					# Show label
	if root: # Check if root is not null
		# root is the parent of the nodes you want to destroy,
		# 1 is the index of the first child to destroy,
		# null is the next scene to load
		get_node("/root/Singleton/").destroy_from(root,1,"res://dialog_lost.scn")
		