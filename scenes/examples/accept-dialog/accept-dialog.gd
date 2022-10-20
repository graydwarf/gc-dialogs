extends Node2D

onready var _acceptDialog = $AcceptDialog
onready var _responseLabel = $ResponseLabel
var _dialogResult

func ShowAcceptDialog():
	ResetDialogResult()
	SetResponseText("Waiting for user to accept notification...")
	SetDialogText("You can interact with other things while this dialog type is open. You cannot receive cancelled events for this type of dialog. You could use a check timer or other workarounds.")
	ShowDialog()
	
func ShowModalAcceptDialog():
	ResetDialogResult()
	SetResponseText("Waiting for user to accept notification...")
	SetDialogText("You can not interact with other things while this dialog type is open. You can receive cancelled events. Try 'Esc' or 'X' button.")

	# This is required in order to setup the popup_hide signal
	# triggered by pressing the Cancel button. This approach
	# also prevents the user from clicking behind the dialog
	# when Exclusive is enabled.
	ShowModalDialog()

func ResetDialogResult():
	_dialogResult = "Cancelled"

func ShowDialog():
	_acceptDialog.visible = true

func ShowModalDialog():
	_acceptDialog.call_deferred("popup")
		
func CloseDialog():
	_acceptDialog.visible = false
	
func SetResponseText(message):
	_responseLabel.text = message

func SetDialogText(value):
	_acceptDialog.dialog_text = value
	
func UpdateDialogResult(value = "Cancelled"):
	_dialogResult = value
	if _dialogResult == "Cancelled":
		SetResponseText("User cancelled the dialog!")
	else:
		SetResponseText("User accepted the dialog!")

# This signal can only be setup right
# when the dialog is about to be shown which is
# why we use call_deferred("popup")
func SetupHideDialogSignal():
	_acceptDialog.connect("popup_hide",self, "UpdateDialogResult")
	
func _input(inputEvent):
	if inputEvent is InputEventKey and not inputEvent.echo:
		if Input.is_key_pressed(KEY_ESCAPE):
			CloseDialog()

func _on_AcceptDialog_confirmed() -> void:
	UpdateDialogResult("Accepted")
	CloseDialog()

func _on_ShowDialogButton_pressed() -> void:
	ShowAcceptDialog()
	
func _on_AcceptDialog_about_to_show() -> void:
	SetupHideDialogSignal()

func _on_ShowModalDialogButton_pressed():
	ShowModalAcceptDialog()

func _on_AcceptDialog_popup_hide():
	UpdateDialogResult("Cancelled")
