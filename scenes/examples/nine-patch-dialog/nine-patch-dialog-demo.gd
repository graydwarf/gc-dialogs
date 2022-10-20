extends Node2D

onready var _ninePatchDialogScene = preload("res://scenes/examples/nine-patch-dialog/nine-patch-dialog/nine-patch-dialog.tscn")
onready var _textEdit = $TextEdit
onready var _widthLineEdit = $VBoxContainer/WidthHBoxContainer/WidthLineEdit
onready var _heightLineEdit = $VBoxContainer/HeightHBoxContainer/HeightLineEdit

var _dialogWidth = 200
var _dialogHeight = 100
var _dialogText = "This is the default starting text."
var _dialog

func _ready():
	AddDefaults()

func AddDefaults():
	_widthLineEdit.text = str(_dialogWidth)
	_heightLineEdit.text = str(_dialogHeight)
	_textEdit.text = _dialogText
	
func CreateNinePatchDialog():
	RefreshDialogProperties() 
	_dialog = _ninePatchDialogScene.instance()
	$DialagContainer.add_child(_dialog)
	_dialog.ConfigureDialog(_dialogWidth, _dialogHeight, _dialogText, "ok")
	_dialog.global_position = Vector2(200, 150)

func RefreshDialogProperties():
	_dialogText = _textEdit.text
	_dialogWidth = _widthLineEdit.text.to_int()
	_dialogHeight = _heightLineEdit.text.to_int()

func CloseDialog():
	if is_instance_valid(_dialog):
		_dialog.queue_free()

func _on_UpdateDialogButton_pressed():
	CloseDialog()
	CreateNinePatchDialog()
