extends Node3D
var system = preload("res://system.tscn")
var line
var openFile = FileAccess.open("res://systemsWithCoordinates.json", FileAccess.READ)
var counter = 0
@export var size : int
@export var limit : int

func _process(delta: float) -> void:
	$SOL.set_global_rotation($SOL.get_global_rotation()+Vector3(0,0.1,0)*delta)
	if counter <= limit:
		counter += size
		for i in range(size):
			line = JSON.parse_string("["+ str(openFile.get_line()) + "]")
			var blip = system.instantiate()
			
			blip.visible = false
			$SOL.add_child(blip)
			blip.set_position(Vector3(line[0]["coords"]["x"],line[0]["coords"]["y"],line[0]["coords"]["z"]))
			blip.name = line[0]["name"]
			blip.visible = true
	

func _ready() -> void:
	print(openFile.get_line())
