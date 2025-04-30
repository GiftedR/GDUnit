extends Object
class_name Test

func _init() -> void:
	assert(self != null, "Can't Create an Instance of 'Test', It is a Static Class!")

static func run_all_tests() -> void:
	discover_tests()
	print("Running tests...")

static func discover_tests() -> void:
	CSH.print_pretty(ProjectSettings.get_global_class_list())
	# var methods:Array[Dictionary] = get_method_list()
	# for m:Dictionary in methods:
	# 	if "should" in m["name"].to_lower().split("_"):
	# 		print_rich("[color=fc7ffc]Running test: " + m["name"] + "[/color]")
	# 		call(m["name"])

static func not_null(value) -> void:
	print("WOW!")

static func equal(expected, actual) -> void:
	print("WOW! 2")
