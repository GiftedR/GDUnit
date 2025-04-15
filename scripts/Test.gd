extends Object
class_name Test

static func not_null(value) -> TestDetail:
	return TestDetail.new(value != null)

static func to_test(method:Callable) -> TestItem:
	return TestItem.build(method, method.get_method())

class TestDetail:
	enum Status
	{
		NOTRUN,
		FAILING,
		PASSING
	}
	
	var description:String = ""
	var teststatus:Status = Status.NOTRUN
	
	func _init(condition:bool, detaildescription:String = "") -> void:
		if condition:
			teststatus = Status.PASSING
			description = "Passing: " + detaildescription
		elif !condition:
			teststatus = Status.FAILING
			description = "Failing: " + detaildescription
