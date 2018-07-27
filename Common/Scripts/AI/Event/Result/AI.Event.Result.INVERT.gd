extends "res://Common/Scripts/AI/Event/Result/AI.Event.Result.gd"


func _init(result_, parent_, type_, exit_):
	
	.init(result_, parent_, type_, exit_)
	
	
func EvaluateSuccess(actor, success, recursive):
	
	.ExitBranch(actor, not success)