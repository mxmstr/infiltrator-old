
var Conflict_States = preload("AI.Conflict.States.gd").new().Conflict_States
var Conflict_Result = preload("AI.Conflict.Result.gd")

var conflict = null
var results = []

class sort_by_value:
	static func sort(a, b):
		return a[0] < b[0]


func _init(_conflict):
	
	conflict = _conflict
	
	var _results = Conflict_States[_conflict]
	for result in _results:
		results.append(Conflict_Result(result, results[result]))
		

func Execute(actor):
	
	var scores = []
	
	for result in results:
		scores.append([result.GetScore(actor), result])
	
	scores.sort_custom(sort_by_value, 'sort')
	#scores.sort(key = lambda x: x[0], reverse = True)
	
	if len(scores) > 0:
		var result = scores[0][1]
		result.Execute(actor)
		#own.movement.ChangeStance(own, result.stance)
			
			