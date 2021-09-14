extends Container

func SetResponse(response):
	$ResponseLabel.text = response

func ShowWindowsDialog():
	# This is required in order to setup the popup_hide signal
	# triggered by pressing the Cancel button. This approach
	# also prevents the user from clicking behind the dialog
	# when Exclusive is enabled.
	$WindowDialog.call_deferred("popup")

func ShowMouseBlocker():
	$MouseBlockPanelContainer.visible = true

func HideMouseBlocker():
	$MouseBlockPanelContainer.visible = false

# Apparently this signal can only be setup right
# when the dialog is about to be shown.
func SetupPopupHideSignal():
	$WindowDialog.connect("popup_hide",self, "CloseDialog")

func CloseDialog():
	HideMouseBlocker()
	HideDialog()

func HideDialog():
	$WindowDialog.visible = false

func _on_YesButton_pressed() -> void:
	SetResponse("Yes, of course the user likes cake.")
	CloseDialog()

func _on_NoButton_pressed() -> void:
	SetResponse("No!?!, there is clearly something wrong with this user!")
	CloseDialog()

func _on_OpenDialogButton_pressed() -> void:
	SetResponse("")
	ShowMouseBlocker()
	ShowWindowsDialog()

func _on_WindowDialog_about_to_show() -> void:
	SetupPopupHideSignal()

# godot-companion support functions below here
func Reset():
	CloseDialog()
	SetResponse("")

func Stop():
	pass

func Start():
	pass
