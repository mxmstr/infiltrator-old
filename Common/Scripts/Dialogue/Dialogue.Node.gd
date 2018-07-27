
var Dialogue_Trees = preload("Dialogue.Trees.gd").new().Dialogue_Trees

var action = null
var tree = null
var leaf = null
var text = null
var time = null 
var next = null


func _init(_action, _tree, _leaf=null):
    
    action = _action
    tree = _tree
    
    if _leaf == null:
        leaf = Dialogue_Trees[_action][_tree]['Request_A']
    else:
        leaf = Dialogue_Trees[_action][_tree][_leaf]
    
    text = leaf[0]
    time = leaf[1]
    
    if leaf[2] != null:
        next = get_script().new(_action, _tree, leaf[2])