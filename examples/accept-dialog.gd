extends Container

func ShowAcceptDialog():
	SetResponseText("Waiting for user to accept notification...")

	# This is required in order to setup the popup_hide signal
	# triggered by pressing the Cancel button. This approach
	# also prevents the user from clicking behind the dialog
	# when Exclusive is enabled.
	$AcceptDialog.call_deferred("popup")

# Apparently this signal can only be setup right
# when the dialog is about to be shown which is
# why we use call_deferred("popup")
func SetupHideDialogSignal():
	$AcceptDialog.connect("popup_hide",self, "CloseDialog")

func CloseDialog():
	HideMouseBlocker()
	HideDialog()

func HideDialog():
	$AcceptDialog.visible = false

func SetResponseText(message):
	$ResponseLabel.text = message

func ShowMouseBlocker():
	$MouseBlockPanelContainer.visible = true

func HideMouseBlocker():
	$MouseBlockPanelContainer.visible = false

func _on_AcceptDialog_confirmed() -> void:
	CloseDialog()
	SetResponseText("User accepted the dialog!")

func _on_ShowDialogButton_pressed() -> void:
	ShowMouseBlocker()
	ShowAcceptDialog()

func _on_AcceptDialog_about_to_show() -> void:
	SetupHideDialogSignal()

# godot-companion support functions below here
func Reset():
	CloseDialog()
	SetResponseText("")

func GetSourcePath():
	return DialogCommon._rootGitHubExamplePath + "accept-dialog.gd"

func GetGitHubPath():
	return DialogCommon._rootGitHubExamplePath + "accept-dialog.gd"

func Stop():
	pass

func Start():
	pass
