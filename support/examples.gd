extends HBoxContainer

onready var _panelContainer = $HSplitContainer/PanelContainer
onready var _gridContainer = $HSplitContainer/VBoxContainer/HBoxContainer/ScrollContainer/GridContainer

func _ready() -> void:
	InitSignals()
	LoadExampleNodes()

func InitSignals():
	var _ignore = DialogSignals.connect("LoadExample", self, "LoadExampleHandler")

func LoadExampleNodes():
	for node in _panelContainer.get_children():
		var exampleNode = load("res://support/example-node.tscn")
		var exampleInstance = exampleNode.instance()
		exampleInstance.SetText(node.name)
		_gridContainer.add_child(exampleInstance)

func HideAllExamples():
	for node in _panelContainer.get_children():
		node.visible = false

func LoadExampleHandler(exampleName):
	HideAllExamples()
	for node in _panelContainer.get_children():
		if node.name == exampleName:
			node.visible = true
			break
