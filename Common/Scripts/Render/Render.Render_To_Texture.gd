from bge import logic, texture
from Common.Script import Globals



def RenderToTexture(display, newCam, material, player_visible):

    player_mesh = Globals.EventManager.PlayerList[0].children['ActorArmature'].children['ActorMesh']

    if "RenderToTexture" in display:
        
        #player_mesh.visible = 1
        
        display["RenderToTexture"].refresh(True)
        
        #player_mesh.visible = player_visible
    
    else:
        
        scene = logic.getCurrentScene()
        
        matID = texture.materialID(display, 'MA' + material)

        renderToTexture = texture.Texture(display, matID)
        renderToTexture.source = texture.ImageRender(scene, newCam)

        display["RenderToTexture"] = renderToTexture