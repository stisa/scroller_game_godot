
extends Button

var root = null

func _ready():
	#print(get_node("/root/Singleton/"))
	self.connect("pressed",self,"click_replay")
	root = get_node("/root/Parent/")
func click_replay():
	if root:
		root.get_child(0).hide() # The GameOver label. I might move it to playScn sooner or later
		get_node("/root/Singleton/").destroy_from(root,1,"res://playScn.scn")
	
	

