extends Container

func _ready():
	InitSignals()

func InitSignals():
	gcSignals.connect("gcCancelDialog", self, "gcCancelDialog")

func gcCancelDialog():
	CloseDialog()
	
func SetResponse(response):
	$ResponseLabel.text = response

func ShowDialog():
	ShowMouseBlocker()

	# This is required in order to setup the popup_hide signal
	# triggered by pressing the Cancel button. This approach
	# also prevents the user from clicking behind the dialog
	# when Exclusive is enabled.
	$ConfirmationDialog.call_deferred("popup")

func CloseDialog():
	$ConfirmationDialog.visible = false

func ShowMouseBlocker():
	$MouseBlockPanelContainer.visible = true

func HideMouseBlocker():
	$MouseBlockPanelContainer.visible = false

# Apparently this signal can only be setup right
# when the dialog is about to be shown.
func SetupPopupHideSignal():
	$ConfirmationDialog.connect("popup_hide",self, "DialogCanceled")

func DialogCanceled():
	HideMouseBlocker()

func _on_ConfirmationDialog_confirmed() -> void:
	SetResponse("We now own the users soul for eternity.")

func _on_OpenDialogButton_pressed() -> void:
	SetResponse("Waiting for users response...")
	ShowDialog()

func _on_ConfirmationDialog_about_to_show() -> void:
	SetupPopupHideSignal()
