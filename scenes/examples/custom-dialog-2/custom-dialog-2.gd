extends Node2D

signal CancelDialog

func _ready():
	InitSignals()

func InitSignals():
	connect("CancelDialog", self, "CloseDialog")
	
func SetResponse(response):
	$ResponseLabel.text = response

func ShowDialog():
	$CustomDialog2.visible = true

func CloseDialog():
	HideDialog()

func HideDialog():
	$CustomDialog2.visible = false

func _input(inputEvent):
	if inputEvent is InputEventKey and not inputEvent.echo:
		if Input.is_key_pressed(KEY_ESCAPE):
			CloseDialog()
			
func _on_YesButton_pressed() -> void:
	SetResponse("Yes, of course the user likes it.")
	CloseDialog()

func _on_NoButton_pressed() -> void:
	SetResponse("No!?!, welp.. I dunno about you.")
	CloseDialog()

func _on_OpenDialogButton_pressed() -> void:
	SetResponse("")
	ShowDialog()
