from bge import logic, types
from ..Actor.Actions import *


class Interaction_Menu(types.KX_GameObject):
    
    def __init__(self, own):
        
        self.open = False
        self.object = None
        self.subject = None
        self.selected = 0
        self.text_blocks = []
        

    def ShowIcon(self):
        
        self.scene.objects['Interaction_Icon'].visible = 1
        
    
    def HideIcon(self):
        
        self.scene.objects['Interaction_Icon'].visible = 0
    
    
    def Open(self, own, interaction_obj):
        
        scene = self.scene
        self.text_blocks = []
        
        scene.objects['Interaction_Display'].visible = 1
        scene.objects['Interaction_Select'].visible = 1
    
        handle = interaction_obj.interaction
        
        for state in handle.states:
            if state != handle.name_state and \
             handle.CanChangeState(own, state):
                newText = scene.addObject(scene.objectsInactive['Interaction_Text'], self, 0)
                newText.setParent(self)
                newText.text = state
                self.text_blocks.append(newText)
    
        deltaY = 0.0
        
        for i in self.text_blocks:
            i.localPosition.y += deltaY
            deltaY -= 1.75
                
        self.selected = 0
        self.subject = own
        self.object = interaction_obj
        
        self.open = True
        
            
    def Close(self):
            
        scene = self.scene   
        scene.objects['Interaction_Display'].visible = 0
        scene.objects['Interaction_Select'].visible = 0
        
        for i in scene.objects:
            if i.name == 'Interaction_Text':
                i.endObject()  
        
        self.open = False
        
        
    def Scroll(self, direction):
        
        scene = self.scene
        cursor = scene.objects['Interaction_Select']
        selected = self.text_blocks[self.selected]
        
        if direction:
            
            self.selected += 1
            if self.selected == len(self.text_blocks):
                self.selected = 0
                
            cursor.worldPosition = selected.worldPosition
        
        else:
            
            self.selected -= 1
            if self.selected < 0:
                self.selected = len(self.text_blocks) - 1
                
            cursor.worldPosition = selected.worldPosition
            
    
    def Select(self, own):
        
        scene = self.scene
        
        StartInteraction(self.object, 
                         self.text_blocks[self.selected].text)
        
        self.Close(own)
        
        
    def main(self):
        
        if self.open:
        
            scene = self.scene
            
            if self.subject is not None:
            
                handle = self.object.interaction
                current_state = self.text_blocks[self.selected].text
                
                for state in handle.states:
                    
                    if not handle.CanChangeState(self.subject, current_state):
                        
                        self.Close(self.subject)
                        self.Open(self.subject, handle.obj)
                        
                        if current_state != state:
                            while self.text_blocks[self.selected].text != current_state:
                                self.Scroll(self.subject, True)
                            
                        break
        
        