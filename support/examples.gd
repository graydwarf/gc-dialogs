extends HBoxContainer

onready var _panelContainer = $HSplitContainer/ViewerContainer
onready var _gridContainer = $HSplitContainer/Container/NavContainer/HBoxContainer/ScrollContainer/GridContainer

var _pathToExamplesFolder = "res://scenes/examples/"
var _pathToExampleNodeScene = "res://support/example-node.tscn"

func _ready() -> void:
	InitSignals()
	var listOfExampleFileNames = LoadExampleFileNames()
	CreateNavigationPanel(listOfExampleFileNames)

func InitSignals():
	gcSignals.connect("gcLoadExample", self, "gcLoadExample")

func gcLoadExample(exampleFileName):
	ClearPanelContainer()
	var scenePath = _pathToExamplesFolder + exampleFileName + ".tscn"
	var exampleNode = load(scenePath)
	var exampleInstance = exampleNode.instance()
	exampleInstance.visible = true
	_panelContainer.add_child(exampleInstance)

func ClearPanelContainer():
	for childNode in _panelContainer.get_children():
		_panelContainer.remove_child(childNode)
		
func LoadExampleFileNames():
	var listOfExampleFileNames = []
	var dir = Directory.new()
	if dir.open(_pathToExamplesFolder) == OK:
		dir.list_dir_begin()
		var fileName = dir.get_next()
		while fileName != "":
			if dir.current_is_dir():
				fileName = dir.get_next()
				continue
			else:
				if fileName.ends_with(".tscn"):
					listOfExampleFileNames.append(fileName)
			fileName = dir.get_next()
		dir.list_dir_end()
	return listOfExampleFileNames

func CreateNavigationPanel(listOfExampleFileNames):
	for exampleName in listOfExampleFileNames:
		var exampleNode = load(_pathToExampleNodeScene)
		var exampleInstance = exampleNode.instance()
		exampleInstance.SetText(exampleName.rstrip(".tscn"))
		_gridContainer.add_child(exampleInstance)
