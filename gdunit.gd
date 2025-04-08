@tool
extends EditorPlugin

var dock:Control
var dockshortcut:Shortcut = Shortcut.new()

func _enter_tree() -> void:
	var key0 = InputEventKey.new()
	key0.keycode = KEY_F
	key0.alt_pressed = true
	key0.shift_pressed = true
	
	dockshortcut.events = [key0]
	
	dock = preload("res://addons/gdunit/scenes/UnitTesting.tscn").instantiate()
	add_control_to_bottom_panel(dock, "Unit Testing", dockshortcut)


func _exit_tree() -> void:
	remove_control_from_bottom_panel(dock)
	dock.free()
