extends Container

# Instructions: Add AcceptDialog node, configure the dialogs
# confirmed signal (automatically hides the dialog).

func NotificationAccepted():
	SetResponseText("User accepted the dialog!")

func ShowAcceptDialog():
	$AcceptDialog.show()
	SetResponseText("Waiting for user to accept notification...")

func SetResponseText(message):
	$ResponseLabel.text = message

func ShowMouseBlocker():
	$MouseBlockPanelContainer.visible = true

func HideMouseBlocker():
	$MouseBlockPanelContainer.visible = false

func Reset():
	HideMouseBlocker()
	SetResponseText("")
	$AcceptDialog.visible = false

func _on_AcceptDialog_confirmed() -> void:
	HideMouseBlocker()
	NotificationAccepted()

func _on_ShowDialogButton_pressed() -> void:
	ShowMouseBlocker()
	ShowAcceptDialog()
