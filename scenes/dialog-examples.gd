extends PanelContainer

onready var _viewContainer = $Examples/HSplitContainer/ViewerContainer
onready var _gridContainer = $Examples/HSplitContainer/NavContainer/HBoxContainer/ScrollContainer/GridContainer

onready var _acceptDialogScene = "res://scenes/examples/accept-dialog/accept-dialog.tscn"
onready var _alertDialogScene = "res://scenes/examples/alert-dialog/alert-dialog.tscn"
onready var _confirmationDialogScene = "res://scenes/examples/confirmation-dialog/confirmation-dialog.tscn"
onready var _customDialogScene = "res://scenes/examples/custom-dialog/custom-dialog.tscn"
onready var _customDialog2Scene = "res://scenes/examples/custom-dialog-2/custom-dialog-2.tscn"
onready var _fileDialogScene = "res://scenes/examples/file-dialog/file-dialog.tscn"
onready var _ninePatchDialogScene = "res://scenes/examples/nine-patch-dialog/nine-patch-dialog-demo.tscn"
onready var _windowsDialogScene = "res://scenes/examples/windows-dialog/windows-dialog.tscn"

func _ready() -> void:
	pass

func LoadExample(scenePath):
	ClearViewContainer()
	var scene = load(scenePath).instance()
	_viewContainer.add_child(scene)

func ClearViewContainer():
	for childNode in _viewContainer.get_children():
		_viewContainer.remove_child(childNode)

func _on_NinePatchButton_pressed():
	LoadExample(_ninePatchDialogScene)

func _on_acceptdialogbutton_pressed():
	LoadExample(_acceptDialogScene)

func _on_alertdialogbutton_pressed():
	LoadExample(_alertDialogScene)

func _on_confirmationdialogbutton_pressed():
	LoadExample(_confirmationDialogScene)

func _on_customdialogbutton_pressed():
	LoadExample(_customDialogScene)
	
func _on_customdialog2button_pressed():
	LoadExample(_customDialog2Scene)

func _on_windowsdialogbutton_pressed():
	LoadExample(_windowsDialogScene)

func _on_filedialogbutton_pressed():
	LoadExample(_fileDialogScene)
