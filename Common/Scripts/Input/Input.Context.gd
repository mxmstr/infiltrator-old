var Input_Bindings = preload("Input.Bindings.gd").new().Input_Bindings
var Input_Results = preload("Input.Results.gd").new().Input_Results
const Input_Result = preload("Input.Result.gd")
#onready var Actor_Actions = preload("res://Common/Scripts/Actor/Actor.Actions.gd").new()

var context = null
var actions = {}


func _init(context):
	
	var _actions = Input_Results[context]
	var bindings = Input_Bindings[context]
	
	for action in _actions:
		
		var keys = bindings[action]
		var result = Input_Result.new(context, action)
		
		for key in keys:
			if not key in actions.keys():
				actions[key] = []
			actions[key].append(result)
			
			
func Execute(actor):
	
	for key in actions:
		for result in actions[key]:
			for status in result.status:
				if Input.call('is_action_' + status, key) if status != null else !Input.is_action_pressed(key):
					result.Execute(actor)
					