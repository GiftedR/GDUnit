@tool
extends Control
class_name UnitTestingUI

static var Instance:UnitTestingUI

# @onready var TestList:VBoxContainer = $vbc2_Action_List/scc2_List/vbc2_List

var _goalPer:float = 1.0

# var alltestcollections:Array[TestCollection]

func _init() -> void:
	Instance = self

func _ready() -> void:
	set_result_display()
	# alltestcollections = TestCollection.get_all_test_collections()
	# for tc:TestCollection in alltestcollections:
	# 	TestList.add_child(tc.build())
	# TestCollection.run_all_tests()

# func _change_percentage(value:float) -> void:
# 	TestPerLabel.text = "Goal: %2d%s" % [value, '%']

func set_result_display(total:int = 0, failing:int = 0, passing:int = 0) -> void:
	var percentagecolor:String = "red" if total != 0 && _goalPer > (passing / total) else "green"
	# TestResult.text = "Total: 0\t [color=red]Failing: 0[/color]\t [color=green]Passing: 0[/color]\t Percentage: [color=%s]100%s[/color]" % [percentagecolor, '%'] 
