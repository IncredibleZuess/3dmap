extends Node3D
var system = preload("res://system.tscn")
var line
var openFile = FileAccess.open("res://systemsWithCoordinates.json", FileAccess.READ)

@export var size : int
@export var limit : int

#used as a timer stick
var ticks: float = 0.0

#Number of items
var counter = 0

#initalise a Transform 3d
var SysPos = Transform3D()
	
func Render() -> void:
	for CHUNK in range(limit / size):	
		for i in range(counter, counter + size):
			line = JSON.parse_string("["+ str(openFile.get_line()) + "]")
			$SOLv2.multimesh.set_instance_transform(i, SysPos.translated(Vector3(line[0]["coords"]["x"],line[0]["coords"]["y"],line[0]["coords"]["z"])))
			
		#counter update
		counter += size
		#print(CHUNK)
	
	openFile.close()
	

func _ready() -> void:
	#Clear open line
	print(openFile.get_line())
	#assign size of buffer
	$SOLv2.multimesh.instance_count = limit
	Render()
		
		
