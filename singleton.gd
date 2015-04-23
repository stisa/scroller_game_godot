
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
	
var hScore = 0
var player = null
var highStr = null #Arrey with saved highscores
var highScoreFile = "user://higscore.txt"

func save_highscore(name, score):
	var f = File.new()
	f.open(highScoreFile,File.WRITE)
	f.store_line(name+","+str(score)) # store a line	
	f.close()
	
func read_highscore():
	var f = File.new()
	f.open(highScoreFile,File.READ)
	highStr = f.get_line()
	highStr = highStr.split(",",true)
	# TODO: bring this into a variable to be opened in highscore.scn
	# PS: WTF does a function return in gdscript????
	f.close()