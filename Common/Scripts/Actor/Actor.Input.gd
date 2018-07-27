extends Node

#onready var Actions = preload("res://Common/Scripts/Actor/Actor.Actions.gd").new()
onready var Input_Context = preload("res://Common/Scripts/Input/Input.Context.gd")

var movement_context = null
var look_context = null
var ability_context = null


func _ready():
	
	pass
	#Actions.ChangeMovementInput(owner, 'Movement')
	#Actions.ChangeAbilityInput(owner, 'Abilities')
	
	
func _process(delta):
	
	pass
	#movement_context.Execute(owner)
	#ability_context.Execute(owner)