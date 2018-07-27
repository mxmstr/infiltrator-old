extends Node

var Inventory_Presets = preload("Actor.Inventories.gd").new().Inventory_Presets

var inventory = []

var equip_icon = null
var item_left_hand = null
var item_right_hand = null#Item.new('Unarmed')
var item_display_order = ['Pistol', 'Baton', 'Can', 'Body', 'Unarmed']

var worldmodel_left_hand = null
var worldmodel_right_hand = null
var viewmodel_left_hand = null
var viewmodel_right_hand = null


func _ready():
	
	pass
#	for item_name in Inventory_Presets[self['Inventory_Preset']]:
#		pass#inventory.append(Item.new(item_name))
#
#	for item in inventory:
#		if item.holster != null:
#			pass#CreateHolsterWM(self, getattr(self, item.holster), item)


func _process(delta):
	
	pass
	