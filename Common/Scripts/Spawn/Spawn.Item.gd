from bge import logic
from ..Item.Item import Item
from Common.Script.Interaction.Interactive import Interactive
from Common.Script.Globals import EventManager



def main():
    
    cont = logic.getCurrentController()
    own = cont.owner
    scene = logic.getCurrentScene()
    
    item = scene.addObject('Item_' + own['Name'], own, 0)
    EventManager.InitializeItem(item)
    
    own.endObject()