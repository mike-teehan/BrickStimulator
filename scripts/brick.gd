
extends Control

var mousedown
var physobj

func _ready():
	mousedown = false
	physobj = get_parent()

func _input_event(ev):
	if(!mousedown && ev.type == InputEvent.MOUSE_BUTTON && ev.pressed):
		mousedown = true
		get_parent().set_meta("explode", "brick")
		#get_parent().hide()
#		var explosion = ResourceLoader.load("res://explosion.scn").instance()
#		explosion.set_pos(self.get_global_pos())
#		explosion.set_linear_velocity(physobj.get_linear_velocity())
#		explosion.get_child(0).set_emitting(true)
#		get_node("../../../BrickLayer").add_child(explosion)
#		for b in self.get_children():
	if(mousedown && ev.type == InputEvent.MOUSE_BUTTON && !ev.pressed):
		mousedown = false
