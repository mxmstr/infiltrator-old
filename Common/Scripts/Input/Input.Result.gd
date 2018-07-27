var Input_Bindings = preload("Input.Bindings.gd").new().Input_Bindings
var Input_Results = preload("Input.Results.gd").new().Input_Results
#onready var Actor_Actions = preload("res://Common/Scripts/Actor/Actor.Actions.gd").new()

var context = null
var action = null
var status = null
var results = null
var interactions = null


func _init(_context, _action):
	
	context = _context
	action = _action
	
	status = Input_Results[context][action]['Status']
	results = Input_Results[context][action]['Results']
	results = [] if results == null else results
	interactions = Input_Results[context][action]['Interactions']
	interactions = [] if interactions == null else interactions
	
	
func Execute(actor):
	
	for result in results:
		pass#Actor_Actions.call(result, actor)
		
	for interaction in interactions:
		pass#StartInteraction(actor, interaction)
			