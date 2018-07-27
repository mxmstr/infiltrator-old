from bge import logic
from Common.Script.Actor.Actions import *
from Common.Script.Globals import SightRange_Normal


def Standing(player):

    return player.localLinearVelocity.length < 0.5


def Walking(player):

    return player.localLinearVelocity.length > 0.5 and player.localLinearVelocity.length < 1.75


def Running(player):

    return player.localLinearVelocity.length > 1.75


def JustChangedStance(player):
    
    return (
        not TimerFinished(player, 'Stance')# and \
        #not TimerFinished(player, 'Move')
        )


def InWalkZone(player):
    
    sensor = player.sensors['Collision_Zone']
    return sensor.positive and sensor.hitObject['Zone'] == 'Walkway'


def InHangoutZone(player):
    
    sensor = player.sensors['Collision_Zone']
    return sensor.positive and sensor.hitObject['Zone'] == 'Hangout'


def InWorkZone(player):
    
    sensor = player.sensors['Collision_Zone']
    return sensor.positive and sensor.hitObject['Zone'] == 'Work'


def InBlendin(player):
    
    return player.interaction.state == 'Blendin'


def StaringAtNPC(player):
    
    npc_list = Globals.EventManager.NPCList.copy()
    npc_list.sort(key = lambda x: x.getVectTo(player)[0], reverse = True)
    
    for npc in npc_list:
        
        vect_player = player.camera.getAxisVect(Vector((0, 0, -1)))
        vect_npc = player.camera.getVectTo(npc.collision_head)
        dist = vect_npc[0]
        vect = vect_npc[1]
        view_angle = vect.angle(vect_player)
        
        if view_angle < 0.25 and \
            dist < SightRange_Normal:
            return True
    
    return False

