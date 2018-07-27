from bge import logic, types
from ..Actor.Actions import *


class UI_Profile(types.KX_GameObject):
    
    def __init__(self, own):
        
        self.SetProfileDisplay('Profile_Default')
        
        
    def SetProfileDisplay(self, name):
        
        scene = self.scene
        
        if hasattr(self, 'display'):
            self.display.endObject()
        
        new_display = scene.objectsInactive[name]
        self.display = scene.addObject(
            new_display,
            self
            )
        
        self.display.playAction(
            'Profile_Opacity', 0.5, 0.5)
        
        
    def SetValue(self, value):
        
        self.display.playAction(
            'Profile_Opacity', value, value)
        
        
    def main(self):
        
        pass
    
        