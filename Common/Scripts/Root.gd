#from bge import logic, types, events
#from Common.Script import Globals
#from Common.Script.AI.Event.Event import AI_Event
#from Common.Script.AI.Event import Triggers
#from Common.Script.AI.Event.Tree.Trees import Result_Trees
#from Common.Script.AI.Event.Tree.Tree import AI_Tree

extends Node

#onready var Globals = preload("Globals.gd").new()
onready var Input_Results = preload("Input/Input.Results.gd").new().Input_Results
onready var Input_Context = preload("Input/Input.Context.gd")
onready var AI_Trees = preload("AI/Event/Tree/AI.Event.Trees.gd").new().Result_Trees
onready var AI_Tree = preload("AI/Event/Tree/AI.Event.Tree.gd")
onready var AI_Events = preload("AI/Event/AI.Events.gd").new().AI_Events
onready var AI_Event = preload("AI/Event/AI.Event.gd")

var Players = []
var NPCs = []
var Interactives = []
var UIHandlers = []

var Items = []
var Ragdolls = []
var Projectiles = []
var AIEventsList = []
var Cameras = []
var Sequences = []
var InputContexts = []


func InitInput():
	
	for context in Input_Results:
		InputContexts.append(Input_Context.new(context))


#func InitInteractive():
#
#    for obj in logic.getCurrentScene().objects:
#        if 'interactive' in obj:
#            InitializeObj(obj, Interactive)
#
#
#func InitUIHandlers():
#
#	pass
##    scene_console = next((x for x in logic.getSceneList() if x.name == 'Console'), None)
##    InitializeObj(scene_console.objects['Console'], Console)
##
##    scene_ui = next((x for x in logic.getSceneList() if x.name == 'UI'), None)
##    InitializeObj(scene_ui.objects['Dialogue_Text_Start'], Dialogue_Menu)
##    InitializeObj(scene_ui.objects['Interaction_Text_Start'], Interaction_Menu)
##    InitializeObj(scene_ui.objects['Inventory_Text_Start'], Inventory_Menu)
##    InitializeObj(scene_ui.objects['Profile_Display_Start'], UI_Profile)
#
#
#func InitializeItem(obj, static=False):
#
#    obj = InitializeObj(obj, Interactive)
#
#    if not static:
#        Items.append(obj)
#        obj.properties = Item(obj['Item'])
#
#    return obj
#
#
func EventExists(name, obj):
	
	for event in AIEventsList:
		if event.name == name and event.object == obj:
			return true
			
	return false
	
	
func TriggerEvent(actor, event, type):
	
	if not EventExists(event, actor):
		AIEventsList.append(AI_Event.new(event, type, actor))
		
		
func ScanEvents(type, obj):
	
	for type in AI_Events:
		for event in AI_Events[type]:
			
			var trigger = AI_Events[type][event]['trigger']
			if trigger != null and not EventExists(event, obj):
				pass
	#			if Triggers.call(trigger, obj):
	#				AIEventsList.append(AI_Event.new(event, type, obj))
					
					
func RemoveEvent(name, type, obj):
	
	for event in AIEventsList:
		if event.name == name and event.type == type and event.object == obj:
			AIEventsList.remove(event)
			return
			
			
func RemoveObjectEvents(type, obj):
	
	for event in AIEventsList:
		if event.type == type and event.object == obj:
			AIEventsList.remove(event)
			
			
func OnEventExpired(event):
	
	AIEventsList.remove(event)
	
	
func _ready():
	
	InitInput()
	#from Common.Script.Input.Results import Input_Results     
	#from Common.Script.Input.Context import Input_Context
	#from Common.Script.UI.Console import Console
	#from Common.Script.UI.Dialogue_Menu import Dialogue_Menu
	#from Common.Script.UI.Interaction_Menu import Interaction_Menu
	#from Common.Script.UI.Inventory_Menu import Inventory_Menu
	#from Common.Script.UI.Profile import UI_Profile
	#from Common.Script.AI.Event.Events import Event_Properties
	#from Common.Script.AI.Event.Event import AI_Event
	#from Common.Script.AI.Event.Triggers import *
	#from Common.Script.Interaction.Interaction import Interaction
	#from Common.Script.Interaction.Interactive import Interactive
	#from Common.Script.Animation.Sequence import Sequence
	#from Common.Script.Actor.Actions import *
	#
	#own.InitSpawn()
	##own.InitInteractive()
	#own.InitUIHandlers()
	#own.InitInput()
	#own.InitAITrees()
	
	TriggerEvent(self, 'Roam', 'Default')
	
	
func _process(delta):
	
	for event in AIEventsList:
		if event.expiration_time == null:
			var trigger = AI_Events[event.type][event.event]['trigger']
#			if trigger != null and not Triggers.call(trigger, event.object):
#				AIEventsList.remove(event)

#    for item in Items:
#        if item.invalid:
#            Items.remove(item)
#        else:    
#            ScanEvents('Item', item)
#
#    for cam in Cameras:
#        cam.main()
#
#
#    for ragdoll in Ragdolls:
#        ScanEvents('Ragdoll', ragdoll)
#
#    for player in Players:
#        player.main()
#        ScanEvents('Player', player)
#
#    for npc in NPCs:
#        npc.main()
#        ScanEvents('NPC', npc)
#
#    for obj in Interactives:
#        obj.main()
#
#
#    for sequence in Sequences:
#        sequence.Execute()