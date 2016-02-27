
extends Node2D

var errframe

func _ready():
	errframe = get_node("ErrorFrame")

func _on_EscapeButton_pressed():
	get_tree().quit()

func _on_OKButton_pressed():
	hide_error()

func _on_XButton_pressed():
	hide_error()

func _on_DLCButton_pressed():
	show_error()

func show_error():
	get_tree().set_pause(true)
	errframe.show()

func hide_error():
	errframe.hide()
	get_tree().set_pause(false)
