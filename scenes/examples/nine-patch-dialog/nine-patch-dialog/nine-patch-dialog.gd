extends Node2D
class_name NinePatchDialog

signal ToggleDragState
onready var _background = $BackgroundNinePatchRect
onready var _textLabel = $TextLabel
onready var _acceptButton = $AcceptButton
onready var _cancelButton = $CancelButton
onready var _okButton = $OkButton

var _dialogGrabPosition : Vector2
var _dialogOriginalPosition : Vector2
var _dialogDragging = false
var _dialogWidth = 0
var _dialogHeight = 0
var _dialogPadding = 10
func _ready():
	InitSignals()

func InitSignals():
	connect("ToggleDragState", self, "ToggleDragState")

func ConfigureDialog(dialogWidth, dialogHeight, dialogText, dialogButtons):
	_dialogWidth = dialogWidth
	_dialogHeight = dialogHeight
	_background.rect_size = Vector2(_dialogWidth, _dialogHeight)
	_textLabel.rect_size = Vector2(_dialogWidth - _dialogPadding, _dialogHeight)
	_textLabel.text = dialogText
	UpdateButtons(dialogButtons)

func UpdateButtons(dialogButtons):
	if dialogButtons.to_lower() == "acceptcancel":
		_acceptButton.visible = true
		_cancelButton.visible = true
		SetButtonFirstPosition(_cancelButton)
		SetButtonSecondPosition(_acceptButton)
	elif dialogButtons.to_lower() == "ok":
		_okButton.visible = true
		SetButtonFirstPosition(_okButton)

func SetButtonFirstPosition(button):
	button.rect_position = Vector2(_dialogWidth - button.rect_size.x - _dialogPadding, _dialogHeight - button.rect_size.y  - _dialogPadding)

func SetButtonSecondPosition(button):
	button.rect_position = Vector2(_dialogWidth - (button.rect_size.x * 2) - _dialogPadding, _dialogHeight - button.rect_size.y - _dialogPadding)
	
func GetDialogWidth():
	return _dialogWidth

func GetDialogHeight():
	return _dialogHeight

func IsShowing():
	return visible
	
func _process(_delta):
	if _dialogDragging:
		var mousePosition = get_global_mouse_position()
		# Need to set our original grab position 1 time.
		if _dialogGrabPosition == Vector2(0, 0):
			_dialogGrabPosition = mousePosition
			_dialogOriginalPosition = self.global_position
		self.global_position = _dialogOriginalPosition + (mousePosition - _dialogGrabPosition)
	else:
		_dialogGrabPosition = Vector2(0, 0)
		
func ToggleDragState():
	_dialogDragging =! _dialogDragging

func CloseDialog():
	queue_free()
	
func _on_BackgroundNinePatchRect_gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			emit_signal("ToggleDragState")
		elif event.button_index == BUTTON_LEFT and !event.pressed:
			emit_signal("ToggleDragState")

func _on_AcceptButton_pressed():
	# TODO: Emit Signal to do something
	CloseDialog()

func _on_CancelButton_pressed():
	# TODO: Emit Signal to do something
	CloseDialog()

func _on_OkButton_pressed():
	# TODO: Emit Signal to do something
	CloseDialog()
