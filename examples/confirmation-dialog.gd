extends Container

# Instructions: Add ConfirmationDialog node, customize title, add buttons,
# hook up button signals, handle dialog visibility.

func SetResponse(response):
	$ResponseLabel.text = response

func ShowDialog():
	$ConfirmationDialog.visible = true

# Only needed if we need to close the dialog for the user
func HideDialog():
	$ConfirmationDialog.visible = false

func ShowMouseBlocker():
	$MouseBlockPanelContainer.visible = true

func HideMouseBlocker():
	$MouseBlockPanelContainer.visible = false

func Reset():
	HideDialog()
	SetResponse("")
	HideMouseBlocker()

func _on_ConfirmationDialog_confirmed() -> void:
	SetResponse("We now own the users soul for eternity.")

func _on_OpenDialogButton_pressed() -> void:
	SetResponse("Waiting for users response...")
	ShowDialog()
