extends PanelContainer
class_name TestCollection

var vbc:VBoxContainer

func _init() -> void:
	name = str(self)

func _enter_tree() -> void:
	vbc = VBoxContainer.new()
	add_child(vbc)

func _ready() -> void:
	for test:Callable in _get_tests():
		vbc.add_child(Test.to_test(test))
	name = get_script().get_global_name()

func _get_tests() -> Array[Callable]:
	var tcc:TestCollection = TestCollection.new()
	var testmethods:Array = get_method_list()
	var tests:Array[Callable] = []
	
	for item:Dictionary in testmethods:
		if !tcc.contains_method_name(item["name"]):
			tests.append(Callable(self, item["name"]))
	
	return tests

func contains_method_name(methodname:String) -> bool:
	var tcc:TestCollection = TestCollection.new()
	
	for method:Dictionary in tcc.get_method_list():
		if method["name"] == methodname:
			return true
	
	return false

func build() -> TestCollection:
	return self

static func run_all_tests() -> void:
	print("Running all Tests...")

static func get_all_test_collections() -> Array[TestCollection]:
	var testcollections:Array[TestCollection] = []
	
	for item:Dictionary in ProjectSettings.get_global_class_list():
		if item["base"] == "TestCollection":
			testcollections.append(load(item["path"]).new())
	
	return testcollections
