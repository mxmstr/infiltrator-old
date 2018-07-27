from mathutils import Vector
from Common.Script.Actor import Actions



def Pass(own):
    
    pass
    

def RotateToTarget(own):
    
    object = own.target
    
    Actions.MoveTo(own, object.worldPosition, Vector((0, 0, 0)))
    
    
def RotateToEvent(own):
    
    object = own.event.object
    
    Actions.MoveTo(own, object.worldPosition, Vector((0, 0, 0)))
    

def MoveToTarget(own):
    
    object = own.target
    
    Actions.MoveTo(own, object.worldPosition)


def MoveToEvent(own):
    
    object = own.event.object
    
    Actions.MoveTo(own, object.worldPosition)
    
    
def DequipWeapon(own):
        
    if Actions.IsEquippedRightHand(own) and Actions.CanStoreRightHand(own):
        Actions.StartInteraction(own, 'Equip')
    
    
def Arrest(own):
    
    player = own.event.object
    item = own.item_right_hand
    
#     if player.item_right_hand.rank > item.rank:
#         EquipEquivalent(own)
        
    if Actions.IsVisible(own, player.collision_spine):
        if own.getVectTo(player)[0] < 0.5:
            pass#Actions.StartInteraction(own, 'Arrest', player)
                
    
def FireWeapon(own):
    
    player = own.event.object
    item = own.item_right_hand
    
    if Actions.InteractionPreset(own, 'Actor_Action_Primary'):
        
        Actions.StartInteraction(own, 'Cancel')
        
    elif Actions.InteractionPreset(own, 'Actor_Default'):
        
        if Actions.IsVisible(own, player.collision_chest):
            if item.clip == 0:
                Actions.StartInteraction(own, 'Reload')
            else:
                if own.getVectTo(player)[0] < item.range_max:
                    Actions.StartInteraction(own, 'Action_Primary')
                    
                    