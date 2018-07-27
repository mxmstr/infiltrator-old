from bge import logic
from Common.Script.Globals import EventManager
from Common.Script.Camera.Controller import Camera_Controller
from Common.Script.Actor.Presets import Actor_Player


def main():

    cont = logic.getCurrentController()
    own = cont.owner
    scene = logic.getCurrentScene()
    
    player = scene.addObject('ActorCollision', own, 0)
    player['type'] = 'Player'
    player['Inventory_Preset'] = 'Player'
    
    mesh = player.children['ActorArmature'].children['ActorMesh']
    #mesh.visible = 0
    
    camera_controller = EventManager.InitializeObj(
        scene.addObject('Camera_Controller'), Camera_Controller)
    camera_controller.setParent(player.children['ActorCollision_top'])
    scene.active_camera = camera_controller.children[0]
    
    EventManager.InitializeObj(player, Actor_Player)
    
    own.endObject()