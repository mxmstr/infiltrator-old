from bge import logic, types
from ..Actor.Actions import *
from Common.Script.Dialogue.Node import Dialogue_Node


class Dialogue_Menu(types.KX_GameObject):
    
    def __init__(self, own):
        
        self.open = False
        self.selected = 0
        self.text_blocks = []
        
        
    def Open(self, own, interaction_obj):
        
        scene = self.scene
        self.text_blocks = []
        
        scene.objects['Dialogue_Display'].visible = 1
        scene.objects['Dialogue_Select'].visible = 1
    
        handle = interaction_obj.interaction
        for action in ('Question', 'Threaten', 'Apologize', 'Follow Me'):
            newText = scene.addObject(scene.objectsInactive['Dialogue_Text'], self, 0)
            newText.setParent(self)
            newText.text = action
            self.text_blocks.append(newText)
    
        deltaY = 0.0
        
        for i in self.text_blocks:
            i.localPosition.y += deltaY
            deltaY -= 1.75
                
        self.selected = 0
        self.subject = own
        self.object = interaction_obj
        
        self.open = True
            
            
    def Close(self, own):
            
        scene = self.scene   
        scene.objects['Dialogue_Display'].visible = 0
        scene.objects['Dialogue_Select'].visible = 0
        
        for i in scene.objects:
            if i.name == 'Dialogue_Text':
                i.endObject()  
        
        self.open = False        
        
        
    def Scroll(self, direction):
        
        scene = self.scene
        cursor = scene.objects['Dialogue_Select']
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
        
        action = self.text_blocks[self.selected].text
        node = Dialogue_Node(action, 'Default')
        
        StartInteraction(own, 'Act_Dialogue', self.subject, node)
        
        self.Close(own)
        
        
    def main(self):
        
        pass    
    
    