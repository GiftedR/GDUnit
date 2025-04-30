@tool
extends Control
class_name UnitTestingUI

static var Instance:UnitTestingUI

var _goalPer:float = 1.0

@onready var total_scroll = $hbc2_Action_List/tbc2_Results/scc2_Total
@onready var passing_scroll = $hbc2_Action_List/tbc2_Results/scc2_Pass
@onready var fail_scroll = $hbc2_Action_List/tbc2_Results/scc2_Fail
@onready var percent_scroll = $hbc2_Action_List/tbc2_Results/scc2_Percentage

static func _static_init() -> void:
	CSH.cache()

func _init() -> void:
	Instance = self

func _ready() -> void:
	total_scroll.name = "Total-0-"
	passing_scroll.name = "Pass-0-"
	fail_scroll.name = "Fail-0-"
	percent_scroll.name = "Percentage-100-"

	$hbc2_Action_List/VBoxContainer/hbc2_Actions/btn2_Run_All_Tests.pressed.connect(func() -> void: Test.run_all_tests())
