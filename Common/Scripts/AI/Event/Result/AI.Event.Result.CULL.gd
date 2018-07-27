extends "res://Common/Scripts/AI/Event/Result/AI.Event.Result.gd"


func _init(result_, parent_, type_, exit_):
	
	._init(result_, parent_, type_, exit_)
	
	
func EvaluateSuccess(actor, success, recursive):
	
	var end = next == null
	
	if not success:
		 
		.ExitBranch(actor, true)
		
	else:
		
		if end:
			.ExitBranch(actor, false)
		else:
			.NextResultNode(actor, recursive)
			
			        