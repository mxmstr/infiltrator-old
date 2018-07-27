from mathutils import Vector
from Common.Script.Actor import Actions
from Common.Script import Globals
from Common.Script.AI.Astar import NodeDict, GetFarthestNode
from Common.Script.Utils.Timer import Timer



def Pass(own):
    
    return True
    

def Wait(own):
        
    #Actions.StartInteraction(own, 'Blendin')
    
    return None


def StartRoute(own):
    
    route_dists = []
    
    for route in own.roam_route:
        route_dists.append(own.getVectTo(route)[0])
        
    own.route_index = route_dists.index(min(float(s) for s in route_dists))
    own.target = own.roam_route[own.route_index]
    
    return True


def Roam(own):
    
    for player in Globals.EventManager.PlayerList:
        if Actions.IsVisible(own, player, 2.0):
            Actions.HeadTrack(own, player.collision_neck)
        else:
            Actions.ResetHeadTrack(own)
        break
        
    return True
    
    
def RouteHasStop(own):
    
    return 'stop' in own.target
    

def StartStopTimer(own):
    
    own.result_var_stack[-1] = Timer('', own.target['stop'] * 100, True)
    
    return True

    
def RouteStop(own):
    
    timer = own.result_var_stack[-1]
    
    Actions.RotateTo(own, own.target.worldOrientation.to_quaternion())
    
    if timer.Tick():
        return True
    
    return None
    
    
def NextRouteStop(own):
    
    own.route_index += 1
    if own.route_index == len(own.roam_route):
        own.route_index = 0
    
    own.target = own.roam_route[own.route_index]
    
    return True


def PickupEventObj(own):
    
    if own.event.object.invalid:
        return True
    
    if Actions.InteractionIsReset(own):
        Actions.StartInteraction(own, 'Pickup', own.event.object)
        
    return None
    

def SetSuspicion(own):
    
    if own.event.suspicion[2] > own.suspicion:
        own.suspicion = own.event.suspicion[2]
    if own.event.anxiety[2] > own.anxiety:
        own.anxiety = own.event.anxiety[2]
    if own.event.identity[2] > own.identity:
        own.identity = own.event.identity[2] 
        
    return True
    

def SetSuspicionOther(own, other):
    
    if own.event.suspicion[2] > other.suspicion:
        other.suspicion = own.event.suspicion[2]
    if own.event.anxiety[2] > other.anxiety:
        other.anxiety = own.event.anxiety[2]
    if own.event.identity[2] > other.identity:
        other.identity = own.event.identity[2] 
        
    return True


def InheritSuspicion(own):
    
    other = own.event.object
    
    if other.suspicion > own.suspicion:
        own.suspicion = other.suspicion
    if other.anxiety > own.anxiety:
        own.anxiety = other.anxiety
    if other.identity > own.identity:
        own.identity = other.identity
        
    return True
    

def InTargetRange(own):
    
    if own.getVectTo(own.target)[0] < own.event.examine_dist:
        return True
    
    return False
    
    
def InExamineRange(own):
    
    obj = own.event.object
    
    if own.getVectTo(obj)[0] < own.event.examine_dist:
        return True
    
    return False


def CheckCanMove(own):

    ray = own.rayCast(own.worldPosition + own.getAxisVect(Vector((0, 0.2, 0))), None, 0, 'Door', 0, 1)
    if ray[0] is not None:
        return False
    
    return True


def OpenDoor(own):
    
    ray = own.rayCast(own.worldPosition + own.getAxisVect(Vector((0, 0.2, 0))), None, 0, 'Door', 0, 1)
    if ray[0] is not None:
        Actions.StartInteraction(ray[0], 'Open')
        return True
    
    return False
    
    
def IsGuard(own):
    
    return own['AI_Preset'] == 'Guard'


def IsCivilian(own):
    
    return own['AI_Preset'] == 'Civilian'
    
    
def DragToDump(own):
    
    if not Actions.InteractionState(own, 'Drag'):
        
        (closest_limb, closest_ragdoll) = Actions.GetNearestLimb(own)
        if closest_limb is not None:
            Actions.StartInteraction(own, 'Drag', closest_limb)
            own.event.object = GetNearestBodyDump(own)
        
    else:    
        
        vect_to_target = own.getVectTo(own.event.object)[1]
        vect_to_target.z = 0
            
        if vect_to_target.length < 1.0:
            return False
    
    return True


def GetNearestBodyDump(own):
    
    targets = []
    
    for obj in Globals.Scene_Main.objects:
        if 'BodyDump' in obj.name:
            targets.append(obj)
            
    targets.sort(key = lambda x: x.getVectTo(own), reverse = False)
    return targets[0] 
    

def DropBody(own):
    
    Actions.ResetInteraction(own)
    
    return True
    
    
def GetNearestGuard(own):

    closest = None
    for npc in Globals.EventManager.NPCList:
        if npc != own and npc['AI_Preset'] == 'Guard' and not npc.is_ragdoll:
            if closest == None or own.getVectTo(npc)[0] < own.getVectTo(closest)[0]:
                closest = npc
                
    own.result_var_stack[-1] = closest.worldPosition
    
    return True
        
    
def ReportEvent(own):
    
    
    target_pos = own.getVectTo(own.roam_route[own.route_index].worldPosition)[1]

    vect_to_target = own.getVectTo(target_pos)[1]
    vect_to_target.z = 0
        
    if vect_to_target.length < 1.0:
        closest = []
        for npc in Globals.EventManager.NPCList:
            if npc != own and npc['AI_Preset'] == 'Guard' and \
                own.getVectTo(npc)[0] < 2.0:
                closest.append(npc)
        
        for npc in closest:
            #npc.player_last_pos = own.player_last_pos
            SetSuspicionOther(own, npc)
            
        Actions.TriggerEvent(own, 'Reporting_Event', 'NPC')
        
        return True
        
    return None
    

def GoToEvent(own):
    
    target_pos = own.result_var_stack[-1]
    
    vect_to_target = own.getVectTo(target_pos)[1]
    vect_to_target.z = 0
        
    if vect_to_target.length < 2.0:
        return True
        
    return None    
    
    
def HideFromPlayer_GetTarget(own):
    
    own.result_var_stack[-1] = NodeDict[GetFarthestNode(own.worldPosition, False)][0]
    
    return True
    
    
def HideFromPlayer_GoToTarget(own):
    
    target_pos = own.result_var_stack[-1]
    
    vect_to_target = own.getVectTo(target_pos)[1]
        
    if vect_to_target.length < 1.0:
        return True
    
    return None

