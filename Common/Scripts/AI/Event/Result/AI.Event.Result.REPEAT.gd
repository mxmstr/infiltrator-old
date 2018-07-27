extends "res://Common/Scripts/AI/Event/Result/AI.Event.Result.gd"


func _init(result_, parent_, type_, exit_):
	
	.init(result_, parent_, type_, exit_)
	
	
func EvaluateSuccess(actor, success, recursive):
	
	var end = next == null
	
	if success:
		
		if end:
			.LoopResultNode(actor)
		else:
			.NextResultNode(actor, recursive)
			
	elif not success:
		
		.ExitBranch(actor, false)
		