#from Common.Script.AI.Event.Result import SUB, SEQ, SELECT, CULL, LOOP, REPEAT, INVERT, PASS
#from Common.Script.AI.Event.Tree.Trees import Result_Trees
var AI_Trees = preload("AI.Event.Trees.gd").new().Result_Trees

var node_types = {
	'SUB' : preload("res://Common/Scripts/AI/Event/Result/AI.Event.Result.SUB.gd"),
	'SEQ' : preload("res://Common/Scripts/AI/Event/Result/AI.Event.Result.SEQ.gd"),
	'SELECT' : preload("res://Common/Scripts/AI/Event/Result/AI.Event.Result.SELECT.gd"),
	'CULL' : preload("res://Common/Scripts/AI/Event/Result/AI.Event.Result.CULL.gd"),
	'LOOP' : preload("res://Common/Scripts/AI/Event/Result/AI.Event.Result.LOOP.gd"),
	'REPEAT' : preload("res://Common/Scripts/AI/Event/Result/AI.Event.Result.REPEAT.gd"),
	'INVERT' : preload("res://Common/Scripts/AI/Event/Result/AI.Event.Result.INVERT.gd")
	}
var event = null
var root = null


func _init(_event):
	
	event = _event
	root = BuildNodeBranch(AI_Trees[_event], null, 'SUB')
	
	
func BuildNodeBranch(branch, parent, type):
	
	var branch_root = null
	var last = null
	var exit = null
	
	
	var last_result = branch[-1]
	if typeof(last_result[0]) == TYPE_STRING and last_result[0] == 'EXIT':
		exit = last_result[2]
		
		
	for result in branch:
		
		var result_name = result[0]
		var is_not_exit = typeof(result_name) != TYPE_STRING or result_name != 'EXIT'
		
		if is_not_exit:
			
			var node = node_types[type].new(result, parent, type, exit)
			
			if result_name in ['SUB', 'SEQ', 'SELECT', 'CULL', 'LOOP', 'REPEAT', 'INVERT']:
				var result_children = result[2]
				node.child = BuildNodeBranch(result_children, node, result_name)
			
			if branch_root == null:
				branch_root = node
				
			if last != null:
				last.next = node    
				
			last = node
			
			
	return branch_root
	
	