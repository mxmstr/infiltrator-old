from bge import logic, types
from ..Actor.Actions import *
from traceback import print_exc, print_stack



class Inventory_Menu(types.KX_GameObject):
    
    def __init__(self, own):
        
        self.open = False
        self.selected = 0
        self.text_blocks = []
    

    def Open(self, own):
        
        scene = self.scene
        scene.objects['Inventory_Display'].visible = 1
        scene.objects['Inventory_Select'].visible = 1
        
        self.text_blocks = []
    
        for i in own.inventory:
            newText = scene.addObject(scene.objectsInactive['Inventory_Text'], self, 0)
            newText.text = i.name
            self.text_blocks.append(newText)
    
        deltaY = 0.0
        
        for i in self.text_blocks:
            i.localPosition.y += deltaY
            deltaY -= 1.75
                
        self.selected = 0
        scene.objects['Inventory_Select'].worldPosition = self.worldPosition
        
        self.open = True
        
        
    def Close(self, own):
            
        scene = self.scene
        scene.objects['Inventory_Display'].visible = 0
        scene.objects['Inventory_Select'].visible = 0
        
        for i in scene.objects:
            if i.name == 'Inventory_Text':
                i.endObject()
        
        self.open = False
        
        
    def Scroll(self, direction):
        
        scene = self.scene
        cursor = scene.objects['Inventory_Select']
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
        
        self.Close(own)
        
        
    def main(self):
        
        pass    
        
          