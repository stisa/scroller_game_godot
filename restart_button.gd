
extends Button

func _ready():
	#print(get_node("/root/Singleton/"))
	self.connect("pressed",self,"click_replay")

func click_replay():
	print(get_node("/root/Singleton/"))
	

