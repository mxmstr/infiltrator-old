from bge import logic
from mathutils import Vector
from Common.Script import Globals
from Common.Script.Actor.Actions import *
#from Mission_AI_Triggers import *



def Constant(obj):
        
    return True


def Item_HardCollision(item):
    
    if item.sensors['Collision'].positive and item.delta_velocity > 2.0:
        return True
    
    
def Item_On_Ground(item):
 
    if item.sensors['Collision'].positive and item.worldLinearVelocity.length < 0.25:
        return True


def Ragdoll_On_Ground(ragdoll):
    
    owner = ragdoll.children['ActorArmature']['Owner']
    body_dump = None
    
    for obj in logic.getCurrentScene().objects:
        if 'BodyDump' in obj.name:
            body_dump = obj
            break
    
    return (
        not InteractionState(owner, 'React_Drag') and \
        ragdoll.getVectTo(body_dump)[0] > 3.0
        )


def Player_HighProfile(player):
    
    return player.profile.value > 0.75


def Player_InSuspiciousArea(player):
    
    sensor = player.sensors['Collision_Zone']
    return sensor.positive and sensor.hitObject['Zone'] == 'Suspicious'

    
def Player_Trespassing(player):
    
    sensor = player.sensors['Collision_Zone']
    return sensor.positive and sensor.hitObject['Zone'] == 'Restricted'


def Player_NearRagdoll(player):
    
    vect_player1 = Vector((player.worldPosition[0], player.worldPosition[1], 0))
    vect_player2 = Vector((0, 0, player.worldPosition[2]))
    
    for event in Globals.EventManager.AIEventList:
        if event.type == 'Ragdoll' and event.name == 'OnGround':
            ragdoll = event.object
            vect_body1 = Vector((ragdoll.worldPosition[0], ragdoll.worldPosition[1], 0))
            vect_body2 = Vector((0, 0, ragdoll.worldPosition[2]))
            
            if (vect_body1 - vect_player1).length < 6.0 and \
                (vect_body2 - vect_player2).length < 1.0:
                return True
            
    return False        


def Player_Pickpocketing(player):
    
    return player.interaction.state == 'Pickpocket'


def Player_Dragging(player):
    
    return player.interaction.state == 'Drag'


def Player_Crouching(player):
    
    return player.movement.stance == 'Crouch'


def Player_Carrying_Stolen_Item(player):
    
    return player.item_right_hand.is_stolen


def Player_Carrying_Melee(player):
    
    return player.item_right_hand.type == 'Melee'


def Player_Carrying_Gun(player):
    
    return player.item_right_hand.type == 'Firearm'


def NPC_Attacking_Player(npc):
    
    return npc.event is not None and npc.event.name in ['Hostile_Brawler', 'Hostile_Shooter']

