extends Node2D

func SetResponse(response):
	$ResponseLabel.text = response

func ShowDialog():
	$CustomDialog2.visible = true

func ShowMouseBlocker():
	$MouseBlockPanelContainer.visible = true

func HideMouseBlocker():
	$MouseBlockPanelContainer.visible = false

func CloseDialog():
	HideMouseBlocker()
	HideDialog()

func HideDialog():
	$CustomDialog2.visible = false

func _on_YesButton_pressed() -> void:
	SetResponse("Yes, of course the user likes it.")
	CloseDialog()

func _on_NoButton_pressed() -> void:
	SetResponse("No!?!, welp.. I dunno about you.")
	CloseDialog()

func _on_OpenDialogButton_pressed() -> void:
	SetResponse("")
	ShowMouseBlocker()
	ShowDialog()

# godot-companion support functions below here
func Reset():
	CloseDialog()
	SetResponse("")

func Stop():
	pass

func Start():
	pass
