@tool
extends EditorPlugin
class_name GDUnit

var dock:Control
var dockshortcut:Shortcut = Shortcut.new()

const addonpath:String = "res://addons/GDUnit/"

func _enter_tree() -> void:
	var key0 = InputEventKey.new()
	key0.keycode = KEY_F
	key0.alt_pressed = true
	key0.shift_pressed = true
	
	dockshortcut.events = [key0]
	
	dock = preload(addonpath + "scenes/UnitTesting.tscn").instantiate()
	add_control_to_bottom_panel(dock, "Unit Testing", dockshortcut)


func _exit_tree() -> void:
	remove_control_from_bottom_panel(dock)
	dock.free()


func restart_plugin() -> void:
	print("Restarting GDUnit")
	EditorInterface.set_plugin_enabled("GDUnit", false)
	
	EditorInterface.set_plugin_enabled.call_deferred("GDUnit", true)

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		if event.keycode == KEY_BACKSLASH && event.pressed && event.alt_pressed:
			restart_plugin()
