
extends Node2D

# Main script for game logic (spawning cubes etc.)

var resOstacolo = null
var ost = null #reference to the cube
var bordoSup = null # reference to the upper border
var nave = null # reference to the ship
var counter = 0 # timer for spawns
var distance = 0 # space traveled
var startPos = 0 # starting position of the ship
var endPos = 0 # final position of the ship
var spawnSpeed = 1.5 # spawn speed
var rand_height=0 # randomize spawn height
var oriz_offset = 300 # cube offset from screen center
var spawnCount = 0 # count how many cubes are spawned
var minSpawnSpeed = 0.4 # minimum time between spawns

func _ready():
	
	bordoSup = get_node("/root/Parent/BordoSopra") # alternative: self.get_child(4) 
	nave = get_node("/root/Parent/Nave") # alternative:  self.get_child(3)
	# Preload cube
	resOstacolo = preload("res://ostacolo.scn")
	set_fixed_process(true)
	startPos = nave.get_pos().x
	
func _fixed_process(delta):
	counter += delta
	distance = nave.get_pos().x - startPos
	# Only increase endPos if the distance increased
	if distance > endPos:
		endPos = distance
		# Decrease time between spawns when the ship advances
		# But no less than %minSpawnSpeed%
		if (spawnSpeed >= minSpawnSpeed):
			spawnSpeed -= 0.1*delta 
	#Spawn 1 cube every %spawnSpeed%
	if counter>spawnSpeed:
		ost = resOstacolo.instance() # Instance cube
		rand_height = rand_range(15.0,1200)
		ost.set_pos(Vector2(bordoSup.get_pos().x+oriz_offset,bordoSup.get_pos().y+rand_height)) # Preposition the cube
		self.add_child(ost) # Spawn the cube
		spawnCount +=1
		counter = 0 # Restart counting for the next spawn
	if nave.countToDeath >=5:						# Check if the ship hasn't moved in the last 5s
		var children = self.get_child_count()		# Get children number
		nave.set_process_input(false)				# Stop processing control inputs
		var i = 0
		# Stop processing all children
		while (i < children ):
			self.get_child(i).set_fixed_process(false)
			i+=1
		var label = self.get_node("/root/Parent/GameOver/")
		label.set_process(true) # Activate game over
		self.set_fixed_process(false)				# Stop updating _fixed_process(), so this is the last run
		