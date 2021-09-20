extends HBoxContainer

onready var _panelContainer = $HSplitContainer/PanelContainer
onready var _gridContainer = $HSplitContainer/VBoxContainer/HBoxContainer/ScrollContainer/GridContainer

func _ready() -> void:
	InitSignals()
	LoadExampleNodes()

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
