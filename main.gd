
extends Node2D

# Script con la logica per la creazione degli ostacoli
var resOstacolo = null
var ost = null
var bordoSup = null
var nave = null
var counter = 0 #timer di spawn
var distance = 0 #distanza percorsa
var startPos = 0 #posizione navetta all'avvio
var endPos = 0 #posizione navetta alla fine
var spawnSpeed = 1.5 # velocità di spawn ostacoli
var rand_height=0 # randomizza altezza di creazione blocchi
var spawnCount = 0 #contatore degli spawn
#Variabili di creazione blocchi
#var delta_massa= 1.0
#var delta_force = 50.0

func _ready():
	# Precaricamento dell'ostacolo
	bordoSup=get_child(4) 
	nave = get_child(3)
	resOstacolo = preload("res://ostacolo.scn")
	set_fixed_process(true)
	startPos = nave.get_pos().x
	
func _fixed_process(delta):
	counter += delta
	distance = nave.get_pos().x - startPos
	if distance > endPos:
		endPos = distance
		if (spawnSpeed >= 0.4):
			#delta_massa+= 0.1*delta
			#delta_force+=0.1*delta 
			spawnSpeed -= 0.1*delta # aumenta la difficoltà man mano che avanza
	#print(endPos)
	#Spawna 1 ostacolo ogni 1s
	#TODO: Randomizzare altezza di creazione
	if counter>=spawnSpeed:
		ost = resOstacolo.instance() #Istanzia ostacolo
		rand_height = rand_range(15.0,1200)
		#print(rand_height)
		ost.set_pos(Vector2(bordoSup.get_pos().x+300,bordoSup.get_pos().y+rand_height)) #Preposiziona ostacolo
		self.add_child(ost) #Spawna ostacolo
		spawnCount +=1
		counter = 0
		print(spawnCount)
	#print (spawnSpeed)
	
