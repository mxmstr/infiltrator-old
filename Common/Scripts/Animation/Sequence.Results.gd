from Common.Script.Actor.Actions import *



def SetActionReady(sequence, start=-1, end=-1):
    
    armature = sequence.obj
    
    current = int(armature.getActionFrame(sequence.layer))
    
    if start == -1:
        armature.setActionFrame(current + 1.0, sequence.layer)
    else:
        sequence.SetStartEnd(start, end)
        armature.setActionFrame(start, sequence.layer)
    
    sequence.current_state = 'Ready'
    sequence.Pause()
        
    
def Melee(sequence):
    
    armature = sequence.obj
    own = armature['Owner']
    
    DamageMelee(own)  


def Shoot(sequence):
    
    armature = sequence.obj
    own = armature['Owner']
    item = own.item_right_hand
    
    if item.clip != 0:
        
        FireProjectile(own, item.projectile)
        sequence.SetState('Fire')
        
        if item.clip_size > -1:
            item.clip -= 1
                    

def EndAction(sequence, last_frame=-1):

    armature = sequence.obj
    own = armature['Owner']
    item = own.item_right_hand
    
    if last_frame == -1:
        armature.setActionFrame(9, sequence.layer)
        sequence.last_frame = 9.0
    else:
        sequence.last_frame = last_frame
    
    SetTimer(own, 'Action', item.reset_time)
    SetActionReady(sequence, last_frame)
    
    
def Reload_Pistol(sequence):
        
    armature = sequence.obj
    own = armature['Owner']
    item = own.item_right_hand    
        
    item.clip = item.clip_size
                     
                       
def Disarm(sequence):
    
    armature = sequence.obj
    own = armature['Owner']
    npc = own.interaction.actor
    
    EquipRightHand(own, npc.item_right_hand)
    DequipRightHand(npc)
    
    