extends Container

func _on_OpenPopupButton_pressed() -> void:
	# This is required in order to setup the popup_hide signal
	# triggered by pressing the Cancel button. This approach
	# also prevents the user from clicking behind the dialog
	# when Exclusive is enabled.
	$Popup.call_deferred("popup")
	ShowMouseBlocker()

func ShowMouseBlocker():
	$MouseBlockPanelContainer.Show()

func HideMouseBlocker():
	$MouseBlockPanelContainer.Hide()

# Apparently this signal can only be setup right
# when the dialog is about to be shown which is
# why we use call_deferred("popup")
func SetupPopupHideSignal():
	$Popup.connect("popup_hide",self, "CloseDialog")

func CloseDialog():
	HideMouseBlocker()
	HideDialog()

func HideDialog():
	$Popup.hide()

func _on_ClosePopupButton_pressed() -> void:
	CloseDialog()

func _on_Popup_about_to_show() -> void:
	SetupPopupHideSignal()

# godot-companion support functions below here
func Reset():
	CloseDialog()

func GetSourcePath():
	return DialogCommon._rootGitHubExamplePath + "popup.gd"

func Stop():
	pass

func Start():
	pass

