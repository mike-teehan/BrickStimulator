
extends Control

var mousedown
var physobj

func _ready():
	mousedown = false
	physobj = get_parent()

func _input_event(ev):
	if(!mousedown && ev.type == InputEvent.MOUSE_BUTTON && ev.pressed):
		mousedown = true
		get_parent().set_meta("explode", "ccv")

	if(mousedown && ev.type == InputEvent.MOUSE_BUTTON && !ev.pressed):
		mousedown = false
