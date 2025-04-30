extends Object
class_name CSH

static var _cachedScripts:Array[Script] = []

static func _static_init() -> void:
    if !_is_class("CSharpScript"):
        return
    
    print("Mono Enabled GD!")

static func cache() -> void:
    print("CACHE!")

static func _is_class(classname:String) -> bool:
    return true

static func print_pretty(json) -> void:
    var jsonstring = JSON.stringify(json) if json is Dictionary else json

    for char:int in jsonstring:
        print(char)
        