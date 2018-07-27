from bge import logic



def main():
    
    own = logic.getCurrentController().owner
    
    for scene in ('Main', 'UI', 'Console', 'ViewModel'):
        if len(logic.getSceneList()) == 0 or \
            next(
                (x for x in logic.getSceneList() if x.name == scene), 
                None
                ) is None:
            return
    
    logic.getCurrentScene().addObject('EventManager')
    own.endObject()