
#var Conflict_Results = preload("AI.Conflict.Results.gd").new().Conflict_Results

var result = null
var stance = null
var item_max_rank = null
var item_ready = null
var strafe = null
var scores = null
var actions = null


func _init(_result, _attributes):
	
	result = _result
	
	for attribute in _attributes:
		set(attribute, _attributes[attribute])
	
	if scores == null:
		scores = []
	else:
		var _scores = scores
		scores = []
	
		for score in _scores:
			scores.append(
				[score[0], 
				 score[1], 
				 score[2], 
				 score[3]]
				)


func GetScore(actor):
	
	var final = 0.0
	
	for score in scores:
		
		var _range = score[0]
		var _value = null#Triggers.call(score[1], actor)
		var _type = score[2]
		var _modifier = score[3]
		
		var calc = {
			'Bool' : _range if _value else 0.0,
			'Linear' : _value * (_range / 1.0),
			'Exp' : pow(_value, _modifier) * (_range / 1.0),
			'Decay' : pow(_modifier, _value) * (_range / 1.0),
			'Sigmoid' : (1.0 / (1.0 + exp(_value))) * (_range / 1.0)
		}
		
		final += calc[_type]
		
	return final


func Execute(actor):
	
	for action in actions:
		pass#Results.call(action, actor)
	   
