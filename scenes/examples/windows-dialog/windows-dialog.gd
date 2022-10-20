extends Container

signal CancelDialog

func _ready():
	InitSignals()

func InitSignals():
	connect("CancelDialog", self, "CloseDialog")
	
func SetResponse(response):
	$ResponseLabel.text = response

func ShowWindowsDialog():
	$WindowDialog.call_deferred("popup")
	
func CloseDialog():
	$WindowDialog.visible = false

func _input(inputEvent):
	if inputEvent is InputEventKey and not inputEvent.echo:
		if Input.is_key_pressed(KEY_ESCAPE):
			CloseDialog()
			
func _on_YesButton_pressed() -> void:
	SetResponse("Yes, of course the user likes cake.")
	CloseDialog()

func _on_NoButton_pressed() -> void:
	SetResponse("No!?!, there is clearly something wrong with this user!")
	CloseDialog()

func _on_OpenDialogButton_pressed() -> void:
	SetResponse("")
	ShowWindowsDialog()

func _on_WindowDialog_popup_hide():
	CloseDialog()
