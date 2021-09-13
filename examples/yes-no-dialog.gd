extends Container

# Instructions: Add WindowsDialog node, customize title, add buttons,
# hook up button signals, handle dialog visibility.

func SetResponse(response):
	$ResponseLabel.text = response

func ShowYesNoDialog():
	$YesNoWindowDialog.visible = true

func HideYesNoDialog():
	$YesNoWindowDialog.visible = false

func ShowMouseBlocker():
	$MouseBlockPanelContainer.visible = true

func HideMouseBlocker():
	$MouseBlockPanelContainer.visible = false

func Reset():
	HideYesNoDialog()
	SetResponse("")
	HideMouseBlocker()

func _on_YesButton_pressed() -> void:
	SetResponse("Yes, of course the user likes cake.")
	HideYesNoDialog()
	HideMouseBlocker()

func _on_NoButton_pressed() -> void:
	SetResponse("No!?!, there is clearly something wrong with this user!")
	HideYesNoDialog()
	HideMouseBlocker()

func _on_OpenDialogButton_pressed() -> void:
	SetResponse("")
	ShowMouseBlocker()
	ShowYesNoDialog()




# godot-companion support functions below here
func Stop():
	pass

func Start():
	pass
