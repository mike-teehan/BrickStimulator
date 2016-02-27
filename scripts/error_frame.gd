
extends TextureFrame

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _on_OKButton_pressed():
	hide_error()

func _on_XButton_pressed():
	hide_error()

func _on_DLCButton_pressed():
	show_error()

func show_error():
	get_tree().set_pause(true)
	self.show()

func hide_error():
	self.hide()
	get_tree().set_pause(false)
