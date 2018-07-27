from bge import logic
from Common.Script import Globals
from Common.Script.Actor.Presets import Actor_NPC
from Common.Script.Camera.Controller import Camera_Controller


def main():
    
    cont = logic.getCurrentController()
    own = cont.owner
    scene = logic.getCurrentScene()
    
    npc = scene.addObject('ActorCollision', own, 0)
    npc['type'] = 'NPC'
    npc['Inventory_Preset'] = own['AI_Preset']
    npc['path'] = own['path']
    npc['AI_Preset'] = own['AI_Preset']
    if 'show_debug' in own:
        npc['show_debug'] = 0.0
     
    npc.children['ActorArmature'].children['ActorMesh'].replaceMesh('ActorMesh' + own['AI_Preset'])
     
    camera_controller = Globals.EventManager.InitializeObj(
        scene.addObject('Camera_Controller'), Camera_Controller)
    camera_controller.setParent(npc.children['ActorCollision_top'])
    
    Globals.EventManager.InitializeObj(npc, Actor_NPC)
    
    own.endObject()
    
     