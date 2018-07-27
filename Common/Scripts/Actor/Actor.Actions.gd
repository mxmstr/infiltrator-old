from random import *
from Common.Script import Globals, Animation
from Common.Script.Utils.Timer import Timer
from Common.Script.Dialogue.Trees import Dialogue_Trees
from Common.Script.Actor.Ragdoll import *
from Common.Script.Actor.Physics import *
from Common.Script.Item.Item import *
from Common.Script.Render.Render_To_Texture import *
from Common.Script.AI.Astar import *
from Common.Script.AI.Conflict.State.State import Conflict_State
from Common.Script.Actor.Injury import Bone_Damages, Decal_Positions
from Common.Script.Projectile.Projectile import Projectile
import copy
from traceback import print_stack
from Common.Script.AI.Presets import AI_Presets



def KeyHit(key_code):
    
    str = events.EventToString(key_code)
    
    if 'MOUSE' in str:
        kevts = logic.mouse.events
    else:    
        kevts = logic.keyboard.events
    
    return kevts[key_code]


def IsActor(own):
    
    return 'Actor' in own


def IsPlayer(own):
    
    return 'type' in own and own['type'] == 'Player'


def IsNPC(own):
    
    return 'type' in own and own['type'] == 'NPC'


def InputAdded(own):
    
    ActionKeys = (
        KeyHit(events.LEFTMOUSE),
        KeyHit(events.RIGHTMOUSE),
        KeyHit(events.MIDDLEMOUSE),
        KeyHit(events.WKEY),
        KeyHit(events.AKEY),
        KeyHit(events.SKEY),
        KeyHit(events.DKEY),
        KeyHit(events.RKEY),
        KeyHit(events.QKEY),
        KeyHit(events.EKEY),
        KeyHit(events.LEFTCTRLKEY),
        )
    
    return logic.KX_INPUT_ACTIVE in ActionKeys


def ThrowMaxed(own):
    
    return own.throw_power >= 0.5


def IsInventoryEmpty(own):
    
    return len(own.inventory) == 0


def IsUnarmed(own):

    return own.item_right_hand.name == 'Unarmed'
    

def IsEquippedRightHand(own):

    return own.item_right_hand.name != 'Unarmed'


def CanStoreRightHand(own):
    
    return own.item_right_hand.can_store


def RightHandHasProjectile(own):
    
    return own.item_right_hand.projectile is not None


def RightHandHasPistol(own):
    
    return own.item_right_hand.name == 'Pistol'


def RightHandAlwaysReady(own):
    
    return own.item_right_hand.always_ready


def RightHandHasAnim(own):
    
    return own.item_right_hand.anim_primary is not None


def RightHandNoAnim(own):
    
    return own.item_right_hand.anim_primary is None


def HolsterHasItem(holster):
    
    return len(holster.children) > 0


def ItemInHolster(own, item):
    
    for holster in (own.collision_hand_l, own.wrist_l, own.wrist_r, own.holster_r, own.holster_l):
        if len(holster.children) > 0 and \
            item == holster.children[0].properties:
            return holster
    
    return None
    
    
def ItemIsCloser(item, closest, hit_position):
    
    return (
        closest is None or \
        abs((hit_position - item.worldPosition).length) < abs((hit_position - closest.worldPosition).length)
        )
    

def ItemInRange(own, item):
    
    return own.camera.rayCast(item, None, 0, 'Wall', 0, 1) is not None
    

def IsVisible(own, other, dist=0.0):
    
    if dist == 0.0:
        dist = Globals.SightRange_Normal
    
    own = own.collision_head 
    if 'Actor' in other:
        other = other.collision_head
    
    vecz = own.getAxisVect(Vector((0, 0, 1)))
    vect_to_target = other.getVectTo(own.worldPosition + own.getAxisVect(Vector((0, 0, -0.1))))[1]
    vect_to_target.negate()
    view_angle = vect_to_target.angle(vecz)
    
    if view_angle < 1.04 and \
        own.rayCast(other, None, dist, 'Wall', 0, 1)[0] is None:
        return True
    
    return False


def StandBlocked(own):
    
    for i in [Vector((0.15, 0.15, 1.9)), Vector((-0.15, -0.15, 1.9)), Vector((0.15, -0.15, 1.9)), Vector((-0.15, 0.15, 1.9))]:
        if not own.collision_top.rayCastTo(own.worldPosition + i, 0, 'Wall') is None:
            return True
    return False


def InteractionHasStates(own):
    
    return own.interaction.states is not None


def InteractionIsReset(own):
    
    return own.interaction.state == 'Default'


def InteractionPreset(own, preset):
    
    return own.interaction.preset == preset


def InteractionState(own, state):
    
    return own.interaction.state == state


def EventObjIsPlayer(own):
    
    return 'type' in own.event.object and own.event.object['type'] == 'Player'


def EventObjIsActor(own):

    return 'Actor' in own.event.object


def EventIsValid(own, event):
    
    return (
        (own.event is None or event.rank >= own.event.rank) and \
        event != own.event and \
        event.object != own and \
        own.suspicion >= event.suspicion[0] and \
        own.anxiety >= event.anxiety[0] and \
        own.identity >= event.identity[0] and \
        own['AI_Preset'] in AI_Presets['Events'][event.type + '_' + event.name]['Observers'] and \
        EventInRange(own, event) and \
        (event.simultaneous_examination or len(event.npcs_examining) == 0) and \
        (event.repeat_examination or not own in event.npcs_examined)
        )   


def EventInRange(own, event):
    
    dist = own.getVectTo(event.object)[0]
    
    if dist < event.range: # event is both visible and not visible
        
        if IsVisible(own, event.object):
            return True
        else:
            if own.rayCast(event.object.worldPosition, None, 0, 'Wall', 0, 1)[0] is not None:
                pass#dist = GetPathDist(CreatePath(own.worldPosition, event.object.worldPosition))
                
            if dist < event.xray_range:
                return True
            
    elif dist < event.xray_range: # event is only not visible
        
        if not IsVisible(own, event.object):
            return True
            
    return False
        

def EventIsInvalid(event):
    
    return (
        event.object.invalid or \
        (
            event.can_invalidate and \
            not event in Globals.EventManager.AIEventList
            )
        )     


def ObjEventIsInvalid(own):
    
    return (
        own.event.object.invalid or \
        (own.event.can_invalidate and \
            (
                not own.event in Globals.EventManager.AIEventList or \
                EventOutOfRange(own)
            )
        )
        )
        
        
def EventOutOfRange(own):
    
    event_pos = own.event.object.worldPosition.copy()
    
    vect_to_target = event_pos - own.worldPosition
    vect_to_target.z = 0
    
    return (
        vect_to_target.length > own.event.range * 1.25 and \
        vect_to_target.length > own.event.xray_range * 1.25
        )    
    
    
    
########################################    
    
    
    
def StartSequence(own, name, reverse=False, overwrite=False):
    
    own.StartSequence(name, reverse, overwrite)
        
        
def SequenceExists(own, name):
        
    for layer in list(range(5)):
        if own.isPlayingAction(layer) and \
            own.getActionName(layer) == name:
            return True
        
    return False
    

def GetSequence(own, layer):
    
#     if IsActor(own):
#         own = own.armature
    
    return own.sequences[layer - 1]


def HeadTrack(own, target):
    
    enforce = own.constraint_head.enforce
    
    enforce += (1 - enforce) / 5
    if enforce > 1.0:
        enforce = 1.0
        
    own.track_target.worldPosition = target.worldPosition.copy()
    own.constraint_head.enforce = enforce


def ResetHeadTrack(own):
    
    enforce = own.constraint_head.enforce
    
    enforce -= enforce / 5
    if enforce < 0.0:
        enforce = 0.0
        
    own.constraint_head.enforce = enforce


def IKInteract(own, target):
    
    delta = target.worldPosition - own.camera.worldPosition
    delta = Vector((delta[0], delta[1], delta[2]))
    delta.rotate(Euler((0, 0, -1 * own.camera.worldOrientation.to_euler().z)))
    
    own.armature_ik_r.worldPosition = target.worldPosition

    if own.constraint_ik_r.enforce == 1.0:
        return True
    
    return False


def DamageMelee(own):
    
    for bone in own.bone_list:
        collision = getattr(own, 'collision_' + bone.lower())
        del collision['actor_collision']
        
    item = own.item_right_hand
    dimensions = own.item_right_hand.dimensions
    hit_object = None
        
    for bone in item.attack_bones:
        
        bone = getattr(own, bone)
        
        hit_object = own.collision_spine.rayCast(
            bone.worldPosition, 
            None, 
            0, 
            'actor_collision', 
            0, 
            1
            )[0]
        
        if hit_object is None:
            for i, j in enumerate(dimensions):
                axis_vect = Vector((0, 0, 0))
                axis_vect[i] = j
                hit_object = bone.rayCast(
                    bone.worldPosition + axis_vect * 2.0, 
                    None,
                    0,
                    'actor_collision',
                    0,
                    1
                    )[0]
                if hit_object is not None:
                    break
                    
        if not hit_object is None:
            if IsPlayer(own):
                TriggerEvent(own, 'Brawler_Caught', 'Player')
            ApplyDamage(
                own, 
                hit_object.parent.parent, 
                None, 
                hit_object.name.split('Collision_')[1])
            break
    
    for bone in own.bone_list:
        collision = getattr(own, 'collision_' + bone.lower())
        collision['actor_collision'] = 0.0
        

def ApplyDamage(own, enemy, projectile, bone):
    
    force_dir = Vector((
        0, 
        own.item_right_hand.damage_primary[2] * (60 / logic.getAverageFrameRate()), 
        0
        ))
    force_dir.rotate(own.worldOrientation)
    
    if projectile is None:
        enemy.applyForce(force_dir, False)
        if IsPlayer(enemy):
            AddScreenDecal(enemy, bone, False)
    else:
        enemy.applyForce(force_dir, False)
        if IsPlayer(enemy):
            AddScreenDecal(enemy, bone, True)
        
    enemy.health -= own.item_right_hand.damage_primary[0] * Bone_Damages[bone]
    enemy.stun += own.item_right_hand.damage_primary[1]


def AddScreenDecal(own, bone, bullet):

    if bullet:
        decal = Globals.Scene_UI.addObject(Globals.Scene_UI.objectsInactive['UI_BulletHit'])
    else:
        decal = Globals.Scene_UI.addObject(Globals.Scene_UI.objectsInactive['UI_MeleeHit'])
        
    decal.worldPosition = MouseOverAny(
        own.camera_ui, 
        Vector((random(), 1 - (Decal_Positions[bone][1] + uniform(-0.25, 0.25)))),
        'Wall'
        )[1]#bone_heights[bone][0], 1 - bone_heights[bone][1])))[1]


def FireProjectile(own, name):
    
    projectile = Globals.Scene_Main.addObject(name)
    
    projectile.worldPosition = own.worldmodel_right_hand.worldPosition
    
    rot = own.track_target.worldPosition - own.worldmodel_right_hand.worldPosition
    rot = Vector((rot[0], rot[1], rot[2]))
    projectile.worldOrientation = rot.to_track_quat('Y', 'Z')
    
    projectile = Globals.EventManager.InitializeObj(projectile, Projectile)
    projectile.shooter = own
    
    if IsPlayer(own):
        TriggerEvent(own, 'Shooter_Noise', 'Player')
        TriggerEvent(own, 'Shooter_Caught', 'Player')
        TriggerEvent(own, 'Shooter_Suspect', 'Player')
        
#        delta = own.viewmodel_right_hand.worldPosition - own.camera_vm.worldPosition
#        delta = Vector((delta[0], delta[1], delta[2]))
#        delta.rotate(Euler((0, 0, own.camera.worldOrientation.to_euler().z)))
#        projectile.worldPosition = own.camera.worldPosition + delta
#        
#        #rot = own.viewmodel_right_hand.worldOrientation.to_euler()
#        #rot.rotate(Euler((0, 0, own.camera.worldOrientation.to_euler().z)))
#        rot = own.track_target_vm.worldPosition - own.viewmodel_right_hand.worldPosition
#        rot = Vector((rot[0], rot[1], rot[2]))
#        rot.rotate(Euler((0, 0, own.camera.worldOrientation.to_euler().z)))
#        projectile.worldOrientation = rot.to_track_quat('Y', 'Z')
    else:
        TriggerEvent(own, 'Shooter_Noise', 'NPC')

    
def ThrowRightHand(own):
        
    TriggerEvent(own, 'ItemThrower_Caught', 'Player')
    TriggerEvent(own, 'ItemThrower_Suspect', 'Player')
    
    SetTimer(own, 'Action', 0.0)
    
    props = DequipRightHand(own)
    dropped = Globals.Scene_Main.addObject('Item_' + props.name, own)
    dropped = Globals.EventManager.InitializeItem(dropped)
    
    dropped.worldPosition = own.camera.worldPosition + own.camera.getAxisVect(Vector((0, 0, -1)))
    dropped.applyForce(
        own.camera.getAxisVect(Vector((0, 0, -1))) * Globals.Throw_Force * (60 / logic.getAverageFrameRate()), 
        False
        )
    dropped.applyTorque(
        own.camera.getAxisVect(Vector((-1, 0, 0))) * Globals.Throw_Angular * (60 / logic.getAverageFrameRate()), 
        True
        )

        
def StoreRightHand(own):
    
    item = own.item_right_hand
    
    if item.name != 'Unarmed':
        if item.holster is not None:
            holster = getattr(own, item.holster)
            if len(holster.children) == 0:
                CreateHolsterWM(own, holster, item)
            
        own.inventory.append(item)
        SortInventory(own)
        DequipRightHand(own)


def CreateHolsterWM(own, holster, item):
    
    wm = Globals.Scene_Main.addObject('ItemWM_' + item.name)
    wm = Globals.EventManager.InitializeItem(wm, True)
    Globals.EventManager.InteractiveList.remove(wm)
    
    wm.setParent(holster, False, True)
    wm.localPosition = item.pos_holster
    wm.localOrientation = item.rot_holster
    wm.properties = item


def GetDisarmNPC(own):
    
    npc_list = Globals.EventManager.NPCList.copy()
    npc_list.sort(key = lambda x: x.getVectTo(own)[0], reverse = True)
    
    closest = None
    for npc in npc_list:
        if own.interaction.CanInteract(npc, 'Act_Disarm'):
            closest = npc
        
    return closest


def GetNearestItem(own):
    
    hit_position = own.camera.worldPosition# + own.camera.getAxisVect(Vector((0, 1, 0))) * 2.5

    item_list = Globals.EventManager.ItemList.copy()
    item_list.sort(key = lambda x: x.getVectTo(hit_position)[0], reverse = True)
    
    closest = None
    for item in item_list:
        if ItemInRange(own, item):
            closest = item
    
    return closest


def GetPickpocketItem(own):
    
    hit_position = own.camera.worldPosition
    
    npc_list = Globals.EventManager.NPCList.copy()
    npc_list.sort(key = lambda x: x.getVectTo(hit_position)[0], reverse = True)
    
    closest = None
    for npc in npc_list:
        for holster in [npc.holster_r, npc.holster_l]:
            if HolsterHasItem(holster) and \
                ItemInRange(own, holster.children[0]):                                         
                closest = holster.children[0]
        
    return closest


def GetNearestLimb(own):
    
    hit_position = own.camera.worldPosition# + own.camera.getAxisVect(Vector((0, 1, 0))) * 2.5
    
    ragdoll_list = Globals.EventManager.RagdollList.copy()
    ragdoll_list.sort(key = lambda x: x.GetVectTo(hit_position)[0], reverse = True)
    
    closest_limb = None
    closest_ragdoll = None
    for ragdoll in ragdoll_list:
        
        for bone_name in ['Ragdoll_Foot_R', 'Ragdoll_Foot_L', 'Ragdoll_Hand_R', 'Ragdoll_Hand_L']:
            
            limb = ragdoll.children['ActorArmature'][bone_name]
            
            if ItemInRange(own.camera, limb):                                              
                closest_limb = limb
                closest_ragdoll = ragdoll
    
    return (closest_limb, closest_ragdoll)


def EquipResult(own, equip_item):
    
    EquipRightHand(own, equip_item.properties)
    
    Globals.EventManager.RemoveObjectEvents('Item', equip_item)
    Globals.EventManager.InteractiveList.remove(equip_item)
    Globals.EventManager.ItemList.remove(equip_item)
    
    equip_item.endObject()
    
      
def PickpocketResult(own, equip_item):
    
    EquipRightHand(own, equip_item.properties)
    
    npc = equip_item.parent.parent.parent
    npc.inventory.remove(equip_item.properties)
    
    equip_item.endObject()
        
        
def EquipRightHand(own, newItem):
           
    own.item_right_hand = newItem   
                
    #if IsEquippedRightHand(own) and CanStoreRightHand(own):
    #    StoreRightHand(own)
    
    current_holster = ItemInHolster(own, newItem)
    if current_holster is not None:
        current_holster.children[0].endObject()
    
    if own.worldmodel_right_hand is not None:
        own.worldmodel_right_hand.endObject()
        
    own.worldmodel_right_hand = Globals.Scene_Main.addObject('ItemWM_' + newItem.name)
    
    bone = getattr(own, newItem.bone)
    own.worldmodel_right_hand.setParent(bone, False, True)
    own.worldmodel_right_hand.localPosition = Vector(newItem.pos_hand)
    own.worldmodel_right_hand.localOrientation = Euler(newItem.rot_hand)

    if IsPlayer(own):
        ChangeHandDisplay(own, 'HandR', newItem.name)
        
#         if own.viewmodel_right_hand != None:
#             own.viewmodel_right_hand.endObject()
# #            own.viewmodel_right_hand.worldPosition = [0, -8, 0]
#         
#         own.viewmodel_right_hand = Globals.Scene_VM.addObject(
#             Globals.Scene_VM.objectsInactive['ItemVM_' + newItem.name]
#             )
# #        own.viewmodel_right_hand = Globals.Scene_VM.objects['ItemVM_' + newItem.name]
#         own.viewmodel_right_hand.visible = 0
#         #own.viewmodel_right_hand.setParent(own.armature_vm.children['Bone_Item_R'])
#         #own.viewmodel_right_hand.localPosition = GetVMItemProperty(newItem.name, 'pos')[1]
#         #own.viewmodel_right_hand.localOrientation = GetVMItemProperty(newItem.name, 'rot')[1]
        
        own.worldmodel_right_hand.visible = 1
      
      
def DequipRightHand(own):
    
    dropped = own.item_right_hand
    own.item_right_hand = Item('Unarmed')
    
    if IsPlayer(own):
        ChangeHandDisplay(own, 'HandR', 'Unarmed')
        
#         own.viewmodel_right_hand.visible = 0
#         #own.viewmodel_right_hand.removeParent()
#         own.viewmodel_right_hand.worldPosition = [0, -8, 0]
#         own.viewmodel_right_hand = None
    
    own.worldmodel_right_hand.endObject()
    own.worldmodel_right_hand = None    
    
    return dropped


def EquipBestWeapon(own):
    
    best = own.item_right_hand
    for item in own.inventory:
        if item.type in ['Gun', 'Melee'] and item.rank > best.rank:
            best = item
    
    if best != own.item_right_hand:    
        StartInteraction(own, 'Equip', None, best)
    

def EquipEquivalent(own):
    
    best = None
    for item in own.inventory:
        player_rank = own.event.object.item_right_hand.rank
        if item.rank in [player_rank, player_rank + 1]:
            if best is None:
                best = item
            elif item.rank > best.rank:
                best = item
    
    if not best in [None, own.item_right_hand]:    
        StartInteraction(own, 'Equip', None, best)
    

def ChangeHandDisplay2(own, item):
    
    display = Globals.Scene_UI.objects['HandR_Display_Item'].meshes[0]
    
    shift = (1.0 / 5.0) * (
        own.item_display_order.index(item) - 
        own.item_display_order.index(own.item_right_hand.name)
        )
    
    verts = GetVerts(display)
    for v in verts:
        uv = v.getUV()
        uv[0] += shift
        v.setUV(uv)
    

def ChangeEquipDisplay2(own, item_name):
    
    if not item_name == own.equip_selection:
        if item_name == 'Unarmed':
            Globals.Scene_UI.objects['HandR_Equip_Display'].visible = 0
        else:
            Globals.Scene_UI.objects['HandR_Equip_Display'].visible = 1
        
        display = Globals.Scene_UI.objects['HandR_Equip_Display_Item'].meshes[0]
        
        shift = (1.0 / 5.0) * (
            own.item_display_order.index(item_name) - 
            own.item_display_order.index(own.equip_selection)
            )
        
        verts = GetVerts(display)
        for v in verts:
            uv = v.getUV()
            uv[0] += shift
            v.setUV(uv)    
            
        own.equip_selection = item_name 
    
    
def ChangeEquipDisplay(own, item_name, attack):
    
    if own.equip_icon is None or \
        ('Inventory_Display_' + item_name) != own.equip_icon.name:
            
        if own.equip_icon != None:
            own.equip_icon.endObject()    
            
        if item_name == 'Unarmed':
            Globals.Scene_UI.objects['Equip_Hand_Symbol'].visible = 0
            Globals.Scene_UI.objects['Attack_Hand_Symbol'].visible = 0
        elif attack:
            Globals.Scene_UI.objects['Equip_Hand_Symbol'].visible = 0
            Globals.Scene_UI.objects['Attack_Hand_Symbol'].visible = 1
        else:
            Globals.Scene_UI.objects['Equip_Hand_Symbol'].visible = 1
            Globals.Scene_UI.objects['Attack_Hand_Symbol'].visible = 0

        display = Globals.Scene_UI.objects['Equip_Display_Item']
        icon = Globals.Scene_UI.addObject(
            Globals.Scene_UI.objectsInactive['Inventory_Display_' + item_name],
            display
            )
        
        own.equip_icon = icon
    

def ChangeHandDisplay(own, hand_name, item_name):
    
    pass
    #display = Globals.Scene_UI.objects[hand_name + '_Display_Item']
    #display.replaceMesh('Inventory_Display_' + item_name)
    

def GetVerts(mesh):
        
    verts = []
    for idx_vert in list(range(4)):
        vertex = mesh.getVertex(0, idx_vert)
        verts.append(vertex)   
        
    return verts 
        

def SortInventory(own):
    
    return own.inventory.sort(key = lambda x: x.rank, reverse = True)


def GetInteraction(own):
    
    own.interaction_sensor['interactive_'] = own.interaction_sensor['interactive']
    del own.interaction_sensor['interactive']
    
    hit_object = own.camera.rayCast(
        own.camera.worldPosition + own.camera.getAxisVect(Vector((0.0, 0.0, -1 * own.max_interaction_dist))),
        None,
        0,
        'interactive',
        0,
        1
        )[0]
        
    own.interaction_sensor['interactive'] = own.interaction_sensor['interactive_']
    del own.interaction_sensor['interactive_']
    
    if not hit_object is None and \
        hit_object.interaction.CanInteract(own):
        return hit_object
        
    return None


def SyncViewModel(own):
    
    camera_main = own.camera
    camera_vm = Globals.Scene_VM.objects['Camera_ViewModel']
    
    rot_local = camera_main.worldOrientation.copy()[2]
    rot_local = Vector((rot_local.x * -1, rot_local.y * -1, rot_local.z))
    camera_vm.alignAxisToVect(rot_local, 2)

#    camera_vm.worldPosition.x += (
#        (-own.top_offset.x - camera_vm.worldPosition.x) * 
#        (own.stance_change_speed * (60 / logic.getAverageFrameRate()))
#        )
#    camera_vm.worldPosition.z += (
#        (own.top_offset.z - own.top_default_pos.z - camera_vm.worldPosition.z) * 
#        (own.stance_change_speed * (60 / logic.getAverageFrameRate()))
#    )
    
    vec_head = own.armature_vm.worldPosition - own.armature_vm.children['HeadPos'].worldPosition
    arm_pos = own.camera_vm.worldPosition + vec_head
    own.armature_vm.worldPosition = [arm_pos[0], arm_pos[1] - 0.16, arm_pos[2]]
    
    own.armature_vm.worldPosition = own.armature_vm.worldPosition.lerp(
        own.armature_vm_defaultpos - own.top_offset - Vector((0.0, 0.0, -0.96)),
        own.stance_change_speed
        )
        
    hit = MouseOverAny(own.camera.children[0], own.screen_position, 'Wall')    
        
    if hit[0] is not None:
        own.track_target.worldPosition = hit[1]
        
        delta = own.track_target.worldPosition - own.camera.worldPosition
        delta = Vector((delta[0], delta[1], delta[2]))
        vec_local = own.camera.getVectTo(own.track_target)[1]
        own.track_target_vm.worldPosition = Vector((
            0.0,
            #Vector((vec_local.x, vec_local.y, vec_local.z)).length, 
            Vector((delta.x, delta.y, 0.0)).length, 
            delta.z
            ))
    

def MouseOverAny(camera, cursor_pos, prop):
    
    distance = 500
    direction = camera.getScreenVect(cursor_pos[0], cursor_pos[1])
    target = camera.worldPosition - direction
    ray = camera.rayCast(target, camera, distance, prop, 0, 1)
    
    return ray


def RenderPIPCam(own):
    
    if own.pip_cam is not None:
        RenderToTexture(
            Globals.Scene_UI.objects['PIP_Cam_Display'], 
            own.pip_cam.children[0], 
            'Screen',
            0
            )
                  
        if GetTimer(own, 'PIP').Tick():
            ChangePIPCam(own, None)
    
    
def ChangePIPCam(own, newCam, duration=0.0):
    
    if own.pip_cam != newCam:
        if newCam is not None:
            Globals.Scene_UI.objects['PIP_Cam_Display'].visible = 1
            SetTimer(own, 'PIP', duration)
        else:
            Globals.Scene_UI.objects['PIP_Cam_Display'].visible = 0    
        
        own.pip_cam = newCam
    
    
def AppendDialogue(own, text):
    
    console = Globals.Scene_Console.objects['Console']
    console.AppendStream(text)


def GetEventTree(event):
    
    return next(
        (x for x in Globals.EventManager.AITreesList if x.name == event), 
        None)


def TriggerEvent(own, event, type):
    
    Globals.EventManager.TriggerEvent(own, event, type)


def ApplySuspicion(own):
       
    own.suspicion += (own.event.suspicion[1] / 60) * (60 / logic.getAverageFrameRate())
    own.anxiety += (own.event.anxiety[1] / 60) * (60 / logic.getAverageFrameRate())
        
    if own.event.identity[1] > own.identity:
        own.identity = own.event.identity[1]

            
def CreatePath(start, end): #find path from start pos to end pos
    
    pos_path = []
    node_start = GetNearestNode(start, True)
    node_end = GetNearestNode(end, True)
    node_path = FindPath(node_start, node_end)
    for i in node_path:#navmesh.findPath(start, end):
        pos_path.append(i.copy())
    #print(path)    
    #path.pop(0)
    return pos_path


def GetPathDist(path):

    dist = 0.0
    for i in list(range(len(path))):
        if not i == 0:
            dist += Vector((path[i] - path[i - 1])).length
    return dist


def GetVectToTarget(own, target_pos):
    
    if own.rayCast(target_pos, None, 0, 'Wall', 0, 1)[0] is not None:
        if len(own.current_path) == 0:
            own.current_path = CreatePath(own.worldPosition, target_pos)
        
        vect_to_target = own.getVectTo(own.current_path[0])[1]
        vect_to_target.z = 0
        
        if len(own.current_path) > 1:
            skip_pos = None
            for i, pos in enumerate(own.current_path):
                if i > 0 and own.rayCast(pos, None, 0, 'Wall', 0, 1)[0] == None:
                    skip_pos = i
            
            if skip_pos != None:
                own.current_path = own.current_path[skip_pos:]
                
        if vect_to_target.length < 0.5:
            own.current_path.pop(0)
            vect_to_target = Vector((0, 0, 0))
    else:
        own.current_path = []
        vect_to_target = own.getVectTo(target_pos)[1]
        vect_to_target.z = 0
        
    return vect_to_target


def RotateTo(own, orientation):
    
    quat_track = orientation
    quat_self = own.worldOrientation.to_quaternion()
    factor = 0.25 * (60 / logic.getAverageFrameRate())
    quat_slerp = quat_self.slerp(quat_track, min(1.0, factor))
    
    own.movement.Rotate(own, Euler((0, 0, quat_slerp.to_euler()[2])))


def MoveTo(own, target_pos, force_dir=Vector((0, 1, 0))):
    
    vect_to_target = GetVectToTarget(own, target_pos)
    
    RotateTo(own, vect_to_target.to_track_quat('Y', 'Z'))
    own.movement.Move(own, force_dir, True)
   
    
def StrafeTo(own, target_pos):

    force_dir = GetVectToTarget(own, target_pos)
    
    own.movement.Move(own, force_dir, False)


def AvoidObstacle(own):
    
    for axis in [
        Vector((0.4, 1.0, 0)), 
        Vector((-0.4, 1.0, 0)),
        Vector((0.4, 0.4, 0)), 
        Vector((-0.4, 0.4, 0))
        ]:
        
        hit_position = own.worldPosition + own.getAxisVect(axis)
        
        if own.rayCast(hit_position, None, 0, 'Wall', 0, 1)[0] is not None or \
            own.rayCast(hit_position, None, 0, 'Actor', 0, 1)[0] is not None:
            own.movement.Move(
                own, 
                Vector((axis[0], 0, 0)).normalized(), 
                True)  
    
    sensor = own.sensors['Collision_Actor']
    
    if sensor.positive:
        
        hit_object = sensor.hitObject
        
        if own.rayCast(hit_object, None, 0.5, 'Actor', 0, 1)[0] is None:
            own.movement.Move(own, own.getVectTo(hit_object)[1], True)  


def SetCollisionToArmature(own):
    
    center = own.collision_foot_r.worldPosition.lerp(
        own.collision_foot_l.worldPosition, 
        0.5
        )
    own.worldPosition = center + Vector((0, 0, 0.2))
    
    #vect_pelvis = own.collision_pelvis.getAxisVect(Vector((0, 0, 1)))
    #vect_pelvis.negate()
    #own.alignAxisToVect(vect_pelvis, 1)
    #print(own.worldOrientation.to_euler())
    
    
def DropRightHand(own):

    props = DequipRightHand(own)
    
    dropped = Globals.Scene_Main.addObject('Item_' + props.name, own)
    dropped = Globals.EventManager.InitializeItem(dropped)
    dropped.properties = props
    dropped.worldPosition = own.camera.worldPosition + own.camera.getAxisVect(Vector((0, 0, -1)))


def ChangeCameraState(camera, type, object, subject=None, reset_cam=True):
    
    camera.ChangeState(type, object, subject, reset_cam)


def ChangeInteractionPreset(own, preset):
    
    if hasattr(own.interaction, 'Exit'):
        own.interaction.Exit()
    
    own.interaction.__init__(preset, own)


def StartInteraction(own, state, subject=None, *params):
    
    if own.interaction.CanInteract(subject, state):
        
        if hasattr(own.interaction, 'Exit'):
            own.interaction.Exit()
        
        if hasattr(own.interaction, 'inherit') and \
            own.interaction.inherit:
            subject = own.interaction.subject
    
        if len(params) == 0:
            params = None
        
        own.interaction.ChangeState(subject, state, params)
        
        return True
    
    else:
        return False


def ResetInteraction(own):
    
    if hasattr(own.interaction, 'Exit'):
        own.interaction.Exit()
    
    if hasattr(own.interaction, 'inherit') and \
        own.interaction.inherit:
        own.interaction.ChangeState(own.interaction.subject, 'Default', None)
    else:
        own.interaction.ChangeState(None, 'Default', None)


def StartActionManual(own, item_name):
    
    StartInteraction(own, 'Action_Primary', None, 'Interact_Input', item_name)
    
    
def ChangeConflictState(own, name):
    
    own.conflict = Conflict_State(name)


def ExecuteConflict(own):
    
    own.conflict.Execute(own)


def GetTimer(own, name):
    
    return next(
        (x for x in own.timers if x.name == name), 
        None)


def SetTimer(own, name, time):
    
	actor.remove_child(timer)
	timer = null
	
    timer = next(
        (x for x in own.timers if x.name == name), 
        None)
    timer.__init__(name, time, timer.countdown)
        
        
def TimerFinished(own, timer):
    
    return next(
        (x for x in own.timers if x.name == timer), 
        None).Tick()


def ChangeMovementPreset(own, preset):
    
    own.movement.ChangePreset(own, preset)
       

func ChangeMovementInput(actor, context):
    
    actor.get_node('Player/Input').movement_context = next(
        (x for x in Globals.EventManager.InputContexts if x.name == context), 
        null)


def ChangeAbilityInput(own, context):
    
    own.ability_context = next(
        x for x in Globals.EventManager.InputContexts if x.name == context)


def InputRotation(own):
    
    vec_offset = (Vector(own.sen_mouse.position) - Vector(own.screen_center)) * (60 / logic.getAverageFrameRate())
    own.movement.InputRotation(own, vec_offset)
    
    
def MoveForward(own):
    
    own.movement.Move(own, Vector((0.0, 1.0, 0.0)), True)
    
    
def MoveBackward(own):
    
    own.movement.Move(own, Vector((0.0, -1.0, 0.0)), True)
    
    
def MoveLeft(own):
    
    own.movement.Move(own, Vector((-1.0, 0.0, 0.0)), True)
    
    
def MoveRight(own):
    
    own.movement.Move(own, Vector((1.0, 0.0, 0.0)), True)


def StartLeanLeft(own):
    
    own.movement.ChangePreset(own, 'LeanLeft')
    
    
def StartLeanRight(own):
    
    own.movement.ChangePreset(own, 'LeanRight')
    
    
def StartLeanReset(own):
    
    own.movement.ChangePreset(own, 'Default')


def StartWalk(own):
    
    own.movement.ChangeStance(own, 'Walk')
    
    
def StartRun(own):
    
    own.movement.ChangeStance(own, 'Run')
    

def StartCrouch(own):
    
    own.movement.ChangeStance(own, 'Crouch')


def InputAbilities(own):
    
    own.ability_context.Execute(own)


def ApplyStun(own):
    
    if own.stun > 25:
    
        force_dir = Vector((0.0, 0.0, 0.0))
        force_dir.x = randint(-2, 2) * own.base_speed * (60 / logic.getAverageFrameRate())
        force_dir.y = randint(-2, 2) * own.base_speed * (60 / logic.getAverageFrameRate())

        own.movement.Move(own, force_dir, True)
        
    own.stun -= (1.0 / 60) * (logic.getAverageFrameRate() / 60)
    if own.stun < 0:
        own.stun = 0.0
    

def CheckDeathPlayer(own):
    
    if own.health < 0:
    
        own.worldPosition = Globals.Scene_Main.objects['DeathRoom'].worldPosition + Vector((0, 0, -2.5))
        own.worldOrientation = Euler((0, 0, 0))
        own.armature.children['ActorMesh'].visible = 1
        own.suspendDynamics(True)
        
        Globals.Scene_Main.active_camera = Globals.Scene_Main.objects['Camera_DeathRoom']
        own.camera_vm.useViewport = True
        own.camera_ui.useViewport = True
        
        ChangeInteractionPreset(own, 'Pass')
        StartInteraction(own, 'Fall')
        
        logic.setTimeScale(0.25) 
    
    
def CheckDeathNPC(own):
    
    if own.health < 0:
                
        CreateRagdoll(own)
        own.armature.setParent(own.armature['Ragdoll_Pelvis'], False, True)
        
        for layer in [1, 2, 3, 4]:
            own.armature.stopAction(layer)
        
        for bone_name in own.bone_list:
            own.armature['RagdollPos_' + bone_name] = own.armature.children['RagdollPos_' + bone_name]
            own.armature.children['RagdollPos_' + bone_name].setParent(own.armature['Ragdoll_' + bone_name], False, True)
            
            own.armature.constraints[bone_name + ':Copy Rotation'].enforce = 0
            own.armature.constraints[bone_name + ':Ragdoll Rotation'].enforce = 1
        
        Globals.EventManager.RagdollList.append(own.armature['Ragdoll_Pelvis'])
        #for bone_name in ['Ragdoll_Foot_R', 'Ragdoll_Foot_L', 'Ragdoll_Hand_R', 'Ragdoll_Hand_L']:
        #    Globals.EventManager.ItemList.append(own.armature[bone_name])
        
        ChangeInteractionPreset(own, 'Actor_Dead')
        
        own.suspendDynamics(True)
        #own.endObject()
        
        
#####################################


def ResetActionAnimation(own):

    item = own.item_right_hand

    if RightHandAlwaysReady(own) and RightHandHasAnim(own):
        StartSequence(own, item.anim_primary)
    else:
        StartSequence(own, 'Actor_Default_Interaction')
        
 
def CheckCanIdle(own):
    
    if not RightHandAlwaysReady(own):
        
        if GetTimer(own, 'Action').Tick():
            pass
            #StartSequence(own, 'Actor_Default_Interaction')
            
        if IsPlayer(own):
            
            if InputAdded(own):
                SetTimer(own, 'Idle', 200.0)
            
            if GetTimer(own, 'Idle').Tick():
                StartInteraction(own, 'Blendin', None)
                    
                    
def ResetIdleTimer(own):
    
    SetTimer(own, 'Idle', 200.0)                        
    
    
def StartAnimation(own, action_name, reverse, keep_frame):
    
    if reverse:
        frame = own.getActionFrame()
        StartSequence(own, action_name, reverse)
        if keep_frame:
            own.setActionFrame(frame)
    else:
        frame = own.getActionFrame()
        StartSequence(own, action_name, reverse)
        if keep_frame:
            own.setActionFrame(frame)
            

def CheckSequenceFinished(own):
            
    sequence = GetSequence(own, 4)
        
    if sequence.IsFinished():
        ResetInteraction(own)
        

def EnableBlendinDisplay(own):

    Globals.Scene_UI.objects['Profile_Display_Start'].SetProfileDisplay('Profile_Blendin')
    
    
def DisableBlendinDisplay(own):

    Globals.Scene_UI.objects['Profile_Display_Start'].SetProfileDisplay('Profile_Default')
   
        
def StartBlendin(own):

    item = own.item_right_hand
    
    if HolsterHasItem(own.collision_hand_l):
        item_left_hand = own.collision_hand_l.children[0].properties
        if item_left_hand.holster is not None and \
            item_left_hand.anim_blendin_override is not None:
            StartSequence(own, item_left_hand.anim_blendin_override)
    elif item.anim_blendin is not None:
        StartSequence(own, item.anim_blendin)
        
    
def CheckBlendinCancel(own):       
        
    if InputAdded(own):
        ResetInteraction(own)
        

def StartActionAnim(own, anim_manual):
    
    sequence = GetSequence(own, 4)
    item = own.item_right_hand
    
    if anim_manual is not None:
        current_item = own.item_right_hand
        own.item_right_hand = Item(anim_manual)
        
        StartSequence(own, own.item_right_hand.anim_primary)
        
        own.item_right_hand = current_item
    else:
        if sequence.name == item.anim_primary and \
            sequence.GetState() == 'Fire':
            Animation.Results.SetActionReady(sequence, sequence.frames[0], sequence.frames[1])
        else:
            StartSequence(own, item.anim_primary)
    
    ChangeInteractionPreset(own, 'Actor_Action_Primary')
    StartInteraction(own, 'Default')
        
        
def CheckActionReady(own):
    
    item = own.item_right_hand
    sequence = GetSequence(own, 4)
    
    if sequence.GetState() == 'Ready':
        
        SetTimer(own, 'Item', item.rate)
        if item.rate == -1.0:
            GetTimer(own, 'Item').Pause()
        
        sequence.Continue()
        
    if sequence.GetState() == 'Fire':
        
        if GetTimer(own, 'Item').Tick():
            ExitAction(own)


def CanCancelAction(own):
    
    sequence = GetSequence(own, 4)
    
    return sequence.GetState() == 'Finished'


def LoopAction(own):
        
    item = own.item_right_hand
    sequence = GetSequence(own, 4)
    
    if sequence.loop:
        sequence.ResetFrames()
    elif sequence.repeat:
        sequence.Continue()
        
        
def ExitAction(own):
    
    ChangeInteractionPreset(own, 'Actor_Default')
    StartInteraction(own, 'Default')
                

def IsSequenceFinished(own):
            
    sequence = GetSequence(own, 4)
        
    return sequence.IsFinished()           
                 
                 
def StartThrowSequence(own):

    item = own.item_right_hand

    StartSequence(own, item.anim_throw)
    

def CheckThrowFrame(own):
    
    sequence = GetSequence(own, 4)
    
    if sequence.GetState() == 'Drop':
        
        ThrowRightHand(own)
        sequence.Continue()
        
        
def CheckThrowCancel(own):
        
    if KeyHit(events.RIGHTMOUSE) == logic.KX_INPUT_NONE:
        ResetInteraction(own)
        return           
    

def StartReloadSequence(own):    
    
    item = own.item_right_hand
    
    StartSequence(own, item.anim_reload)
    
    
def SetCamArmature(own):
    
    ChangeCameraState(own.camera, 'Subjective_ArmatureParent', own.collision_chest, None, False)


def ResetCamera(own):
    
    ChangeCameraState(own.camera, 'Subjective_Default', own.collision_top, None, False)


def FindPickupItem(own):
    
    closest_item = GetNearestItem(own)
    
    if closest_item is None or \
        not StartInteraction(own, 'Act_Pickup', closest_item):
        ResetInteraction(own)


def StartPickupSequence(own):
    
    new_item = own.interaction.subject
    
    StartSequence(own, 'Actor_Pickup_Default')


def CheckPickupFrame(own):
    
    equip_item = own.interaction.subject
    sequence = GetSequence(own, 4)
    
    if not equip_item.invalid:
    
        own.armature_ik_r.worldPosition = equip_item.worldPosition
        
        if sequence.GetState() == 'Equip':
            EquipResult(own, equip_item)
            sequence.Continue()


def StartDropSequence(own):
    
    StartSequence(own, 'Actor_Drop')
    
    
def CheckDropFrame(own):
    
    sequence = GetSequence(own, 4)
        
    if sequence.GetState() == 'Drop':
        DropRightHand(own)
        sequence.Continue()
        
        
def StartEquipSequence(own):
    
    item = own.interaction.params[0]
    
    if item.anim_equip is None:
        EquipRightHand(own, item)
        own.inventory.remove(item)
        ResetInteraction(own)
    else:
        StartSequence(own, item.anim_equip)
    

def CheckEquipFrame(own):  
    
    new_item = own.interaction.params[0]
    sequence = GetSequence(own, 4)
    
    if sequence.GetState() == 'Equip':
        
        EquipRightHand(own, new_item)
        own.inventory.remove(new_item)
        
        sequence.Continue()
        
                     
def StartDequipSequence(own):
    
    item = own.item_right_hand
    
    if item.anim_equip is None:
        StoreRightHand(own)
        ResetInteraction(own)
    else:
        StartSequence(own, item.anim_equip)  
    

def CheckDequipFrame(own):  
    
    sequence = GetSequence(own, 4)
    
    if sequence.GetState() == 'Equip':
        StoreRightHand(own)
        sequence.Continue()
  

def FindPickpocketTarget(own):
    
    closest_item = GetPickpocketItem(own)
    
    if closest_item is None or \
        not StartInteraction(own, 'Act_Pickpocket', closest_item):
        ResetInteraction(own)
        
        
def CheckPickpocketFrame(own):
    
    equip_item = own.interaction.params[0]
    
    if equip_item.invalid:
        ResetInteraction(own)
    elif IKInteract(own, equip_item):
        PickpocketResult(own, equip_item)
        ResetInteraction(own) 


def FindDragTarget(own):
    
    (closest_limb, closest_ragdoll) = GetNearestLimb(own)
    
    if closest_limb is None or \
        not StartInteraction(own, 'Act_Disarm', closest_limb):
        ResetInteraction(own)
 

def StartDrag(own):
    
    drag_limb = own.interaction.subject
    npc = drag_limb['Root'].children['ActorArmature']['Owner']

    ChangeEquipDisplay(own, 'Unarmed', False)
    StartInteraction(npc, 'React_Drag', own)
     

def DragRagdoll(own):
    
    drag_limb = own.interaction.subject
        
    drag_limb.worldLinearVelocity = [0, 0, 0]
    drag_limb.worldPosition = own.collision_hand_l.worldPosition
        

def DropRagdoll(own):        
    
    drag_limb = own.interaction.subject
    npc = drag_limb['Root'].children['ActorArmature']['Owner']
    
    npc.being_dragged = False
    
    
def CheckDialogueClosed(own):
    
    own = own.parent.parent
    npc = own.interaction.object
        

def StartDialogueReact(own):
    
    npc = own.interaction.subject
        
    StartInteraction(npc, 'React_Dialogue', own)
    
    
def ExecuteDialogueNode(own, node):

    npc = own.interaction.subject
    
    node.time -= (1.0 / 60) * (60 / logic.getAverageFrameRate())
    if node.time <= 0.0:
        AppendDialogue(own, node.text)
        node = node.next
    
    target_pos = npc.worldPosition.copy()
    
    if own.getVectTo(npc)[0] > 2.0:
        MoveTo(own, target_pos, Vector((0, 1, 0)))
    else:
        MoveTo(own, target_pos, Vector((0, 0, 0)))
    
    if node == None:
        ResetInteraction(own)
    
    own.interaction.params[1] = node
    

def LockDialogueOrientation(own):
    
    npc = own.interaction.subject
        
    target_pos = npc.worldPosition.copy()
    
    if own.getVectTo(npc)[0] > 2.0:
        MoveTo(own, target_pos, Vector((0, 1, 0)))
    else:
        MoveTo(own, target_pos, Vector((0, 0, 0))) 


def StartHSAct(own):
    
    own = own.parent.parent
    
    StartInteraction(own, 'Act_HS')


def StartHSReact(own):
    
    npc = own.interaction.subject  
        
    StartInteraction(own, 'React_HS', npc)
    StartSequence(npc.armature, 'Actor_Act_HS')
    

def CancelHS(own):
    
    npc = own.interaction.subject
        
    ResetInteraction(npc)
    StartActionManual(npc, 'Unarmed')
        
        
def StartHSSequence(own):
    
    npc = own.interaction.subject
    
    StartSequence(npc.armature, 'Actor_React_HS')
    
    
def MoveHS(own):
    
    npc = own.interaction.subject
    
    vect_own = own.getAxisVect(Vector((0, 1, 0)))
    target_own = own.worldPosition + vect_own * 0.75
    
    if npc.getVectTo(target_own)[0] > 0.1:
        RotateTo(npc, own.worldOrientation)
        StrafeTo(npc, target_own)    
        

def FindDisarmTarget(own):
    
    npc_disarm = GetDisarmNPC(own)
    
    if npc_disarm is None or \
        not StartInteraction(own, 'Act_Disarm', npc_disarm):
        ResetInteraction(own)


def StartActDisarmSequence(own):
    
    npc = own.interaction.subject
    
    StartInteraction(npc, 'React_Disarm', own)
    StartSequence(own, 'Actor_Act_Disarm')


def StartReactDisarmSequence(own):
    
    StartSequence(own, 'Actor_React_Disarm')
    

def LockDisarmMovement(own):   
    
    sequence = GetSequence(own, 4)
    npc = own.interaction.subject
    
    target_pos = npc.worldPosition.copy()
    
    if own.getVectTo(npc)[0] > 1.0:
        MoveTo(own, target_pos, Vector((0, 1, 0)))
    else:
        MoveTo(own, target_pos, Vector((0, 0, 0)))   
    
    
def StartVaultSequence(own):
    
    StartSequence(own, 'Actor_Vault')
    
    
def LockVaultOrientation(own):
    
    obj = own.interaction.subject
        
    own_vec_y = own.getAxisVect(Vector((0, 1, 0)))
    obj_vec_y = obj.getAxisVect(Vector((0, 1, 0)))
    obj_vec_x = obj.getAxisVect(Vector((1, 0, 0)))
    
    direction = fabs(own_vec_y.angle(obj_vec_y)) < radians(90)
    
    if direction:
        own.worldOrientation = obj.worldOrientation
        own.worldOrientation.rotate(Euler((0, 0, radians(180))))
    else:
        own.worldOrientation = obj.worldOrientation
    
    offset = -0.1
    vect_to_obj = own.getVectTo(obj)[1]
    angle = Vector((vect_to_obj[0], vect_to_obj[1], 0.0)).angle(
        Vector((obj_vec_y[0], obj_vec_y[1], 0.0))
        )
    dist_to_obj = cos(angle) * own.getVectTo(obj)[0]
    
    if direction:
        dist_to_obj *= -1
    
    own.worldPosition = (
        own.worldPosition + 
        own.getAxisVect(
            Vector((0, dist_to_obj, 0)) - 
            Vector((0, offset, 0))
            )
        )
        
        
def StartVaultAct(own):
    
    npc = own.interaction.subject
        
    StartInteraction(npc, 'Act_Vault', own)    
    
    
# def Animate(own,):
#     
#     own = self.actor
#     object = self.obj
#     
#     action_name = self.execute_params[0]
#     start = self.execute_params[1]
#     end = self.execute_params[2]
#     reverse = self.execute_params[3]
#     
#     #if object.getActionName() != action_name:
#     if reverse:
#         frame = object.getActionFrame()
#         object.playAction(action_name, end, start)
#         object.setActionFrame(frame)
#     else:
#         frame = object.getActionFrame()
#         object.playAction(action_name, start, end)
#         object.setActionFrame(frame)        


def OpenInteractionMenu(own):
    
    interaction_obj = GetInteraction(own)
    menu = Globals.Scene_UI.objects['Interaction_Text_Start']
    
    if interaction_obj is not None and \
        InteractionHasStates(interaction_obj):
        
        HideInteractionIcon(own)
        menu.Open(own, interaction_obj)
        
        ChangeInteractionPreset(own, 'Actor_Menu_Popup')
        StartInteraction(own, 'Default', menu, interaction_obj)
    else:
        ResetInteraction(own)

        
def OpenInventory(own):
    
    menu = Globals.Scene_UI.objects['Inventory_Text_Start']
    menu.Open(own)
    
    ChangeInteractionPreset(own, 'Actor_Menu_Popup')
    StartInteraction(own, 'Default', menu)


def OpenDialogueMenu(own):
        
    menu = Globals.Scene_UI.objects['Inventory_Text_Start']
    menu.Open(own)
    
    ChangeInteractionPreset(own, 'Actor_Menu_Popup')
    StartInteraction(own, 'Default', menu)


def OpenSearchMenu(own):
    
    npc = own.interaction.subject.parent['Owner']
    menu = Globals.Scene_UI.objects['Inventory_Text_Start']
    menu.Open(own)
    
    HideInteractionIcon(own)
    ChangeInteractionPreset(own, 'Actor_Menu_Popup')
    StartInteraction(own, 'Default', menu)


def ShowInteractionIcon(own):
    
    menu = Globals.Scene_UI.objects['Interaction_Text_Start']
    menu.ShowIcon()


def HideInteractionIcon(own):
    
    menu = Globals.Scene_UI.objects['Interaction_Text_Start']
    menu.HideIcon()
    
    
def MenuPopupOpen(own):
    
    menu = own.interaction.subject
    menu.Open(own, *own.interaction.params)
        
        
def MenuPopupUp(own):
    
    menu = own.interaction.subject
    menu.Scroll(True)
    
    
def MenuPopupDown(own):
    
    menu = own.interaction.subject
    menu.Scroll(False)
    
    
def MenuPopupSelect(own):
    
    menu = own.interaction.subject
    
    MenuPopupClose(own)
    StartInteraction(own, 'Equip', None, own.inventory[menu.selected])
    
    
def MenuPopupClose(own):
    
    menu = own.interaction.subject
    menu.Close(own)
    
    ChangeInteractionPreset(own, 'Actor_Default')
    ResetInteraction(own)
        
        
def StartProneTimer(own):        
    
    SetTimer(own, 'Prone', 3.0)
    
    
def CheckProneFinished(own):    
    
    if TimerFinished(own, 'Prone'): 
        ResetInteraction(own)
        

def ResetProneTimer(own): 
    
    SetTimer(own, 'Prone', 0.0)
    
    
def Pass(own):
    
    pass


    
    