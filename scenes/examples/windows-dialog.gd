extends Container

func _ready():
	InitSignals()

func InitSignals():
	gcSignals.connect("gcCancelDialog", self, "gcCancelDialog")

func gcCancelDialog():
	CloseDialog()
	
func SetResponse(response):
	$ResponseLabel.text = response

func ShowWindowsDialog():
	$WindowDialog.call_deferred("popup")
	
func CloseDialog():
	$WindowDialog.visible = false

func _on_YesButton_pressed() -> void:
	SetResponse("Yes, of course the user likes cake.")
	CloseDialog()

func _on_NoButton_pressed() -> void:
	SetResponse("No!?!, there is clearly something wrong with this user!")
	CloseDialog()

func _on_OpenDialogButton_pressed() -> void:
	SetResponse("")
	gcSignals.emit_signal("gcShowMouseBlockerScreen")
	ShowWindowsDialog()

func _on_WindowDialog_popup_hide():
	CloseDialog()
