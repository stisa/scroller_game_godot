
extends Node2D

# Singleton to handle screen transitions
var root = null

func _ready():
	pass

func destroy_from(nodeParent, intChild, nextScene):
	root= nodeParent
	nodeParent.get_child(intChild-1).set_process(false) # intChild-1 is the last child you want to save
	while intChild < nodeParent.get_child_count():
		nodeParent.get_child(intChild).queue_free()
		intChild +=1
	if nextScene:
		add_scn(nodeParent,nextScene)

func add_scn(parent,scene):
	var scn = null
	var s = null
	scn = load(scene)
	s = scn.instance()
	#s.set_pos(Vector2(0,0))
	parent.add_child(s)