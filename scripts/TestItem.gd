@tool
extends PanelContainer
class_name TestItem

@onready var status:RichTextLabel = $hbc2_Test_Item/rtl2_Status
var _method:Callable
var _startdata:Array
var details:String = ""

#var name:String


func _init(method:Callable = func() -> void: printerr("BAD"), methodname:String = "") -> void:
	_method = method
	if methodname != "":
		name = methodname

func _ready() -> void:
	if _startdata != null && _startdata.size() == 2:
		set_data(_startdata[0], _startdata[1])
	status.text = str(name)

func set_data(method:Callable, methodname:String) -> void:
	_method = method
	name = methodname
	status.text = str(name)

func set_starting_data(method:Callable, methodname:String) -> TestItem:
	_startdata = [method, methodname]
	return self

static func build(method:Callable, methodname:String) -> TestItem:
	return load(GDUnit.addonpath + "scenes/TestItem.tscn").instantiate().set_starting_data(method, methodname)
