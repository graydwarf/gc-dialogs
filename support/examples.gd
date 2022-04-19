extends HBoxContainer

onready var _panelContainer = $HSplitContainer/PanelContainer
onready var _gridContainer = $HSplitContainer/VBoxContainer/HBoxContainer/ScrollContainer/GridContainer

func _ready() -> void:
	InitSignals()
	LoadExampleNodes()
#	TestLocalLoad()
#
#func TestLocalLoad():
#	var a = OS.get_executable_path() 
#	var dir = Directory.new()
#	if dir.open(a) == OK:
#		dir.list_dir_begin()
#		var fileName = dir.get_next()
#		while fileName != "":
#			if dir.current_is_dir():
#				print("Found directory: " + fileName)
#			else:
#				print("Found file: " + fileName)
#			fileName = dir.get_next()
#			var fileContent = LoadFile(fileName)
#	else:
#		print("An error occurred when trying to access the path.")
#
#func LoadFile(fileName):
#	var file = File.new()
#	file.open(fileName, File.READ)
#	var content = file.get_as_text()
#	file.close()
#	return content
	
func InitSignals():
	DialogSignals.connect("LoadExample", self, "LoadExampleHandler")

func LoadExampleHandler(exampleName):
	HideAllExamples()
	for node in _panelContainer.get_children():
		if node.name == exampleName:
			node.visible = true
			break

func LoadExampleNodes():
	for node in _panelContainer.get_children():
		var exampleNode = load("res://support/example-node.tscn")
		var exampleInstance = exampleNode.instance()
		exampleInstance.SetText(node.name)
		_gridContainer.add_child(exampleInstance)

func HideAllExamples():
	for node in _panelContainer.get_children():
		node.Reset()
		node.visible = false
