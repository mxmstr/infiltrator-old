from bge import logic, events, render, types
from Common.Script.AI.Conflict.State.States import Conflict_States
from Common.Script.AI.Conflict.Result.Result import Conflict_Result
from Common.Script.Actor.Actions import *
from Common.Script.Actor.Actor import Actor
from Common.Script.Actor.Profile.Profile import Profile
from Common.Script.Item.Items import Item_Properties
from Common.Script.Item.Item import Item
from Common.Script.Interaction.Interaction import Interaction
from Common.Script import Globals
import time


class Actor_Player(Actor):
    
    def __init__(self, own):
        
        super().__init__(self)
        
        self.addDebugProperty('interaction_preset', True)
        self.addDebugProperty('interaction_state', True)
        self.debug = True
        
        self.profile = Profile()
        
        ChangeMovementInput(self, 'Movement')
        ChangeAbilityInput(self, 'Abilities')
        ChangeCameraState(self.camera, 'Subjective_Default', self.collision_top)
        
        self.interaction = Interaction(self.interaction_preset, self)
        self.interaction.ChangeState(None, self.interaction_default, None)
        
        Globals.EventManager.PlayerList.append(self)
    
	
    def main(self):
        
        self['interaction_preset'] = self.interaction.preset
        self['interaction_state'] = self.interaction.state
        
        for timer in self.timers:
            timer.Tick()
        
        for sequence in self.sequences:
            if sequence is not None:
                sequence.Execute()
        
        InputRotation(self)
        RenderPIPCam(self)
        SyncViewModel(self)
        CheckDeathPlayer(self)
        
        self.movement_context.Execute(self)
        self.ability_context.Execute(self)
        self.movement.Lean(self)
        self.movement.CollisionParent(self)
        self.profile.Execute(self)
        self.interaction.Execute()



class Actor_NPC(Actor):
    
    def __init__(self, own):
    
        super().__init__(self)
        
        self.suspicion = 0.0
        self.anxiety = 0.0
        self.identity = 0
        
        if 'show_debug' in self:
            self.addDebugProperty('event', True)
            self.addDebugProperty('result node', True)
            self.addDebugProperty('result stack', True)
            self.addDebugProperty('suspicion', True)
            self.addDebugProperty('anxiety', True)
            self.addDebugProperty('identity', True)
            self.debug = True
        
        self.event = None
        self.event_queue = []
        self.result_node = None
        self.result_timer = None
        self.result_var_stack = []
        
        self.player_last_pos = []
        for player in Globals.EventManager.PlayerList:
            self.player_last_pos.append(player)
        
        self.target = None
        self.route_index = 0
        self.roam_route = []
        
        route_stops = []
        for obj in logic.getCurrentScene().objects:
            if self['path'] in obj.name:
                route_stops.append(obj)
                
        for i in list(range(len(route_stops))):
            self.roam_route.append(
                logic.getCurrentScene().objects[self['path'] + str(i + 1)]
                )
        
        self.current_route = self.roam_route.copy()
        self.current_path = []
        
        # Interaction
        ScanEvents(self)
        ChangeConflictState(self, 'Pass')
        ChangeCameraState(self.camera, 'Subjective_Default', self.collision_top)
        
        self.interaction = Interaction(self.interaction_preset, self)
        self.interaction.ChangeState(None, self.interaction_default, None)
        
        Globals.EventManager.NPCList.append(self)
    
    
    def main(self):
        
        if self.event is not None:
            self['event'] = self.event.name
            self['result node'] = self.result_node.result[0]
            self['result stack'] = self.result_var_stack[-1]
        else:
            self['event'] = None
        self['suspicion'] = self.suspicion
        self['anxiety'] = self.anxiety
        self['identity'] = self.identity
        
        for timer in self.timers:
            timer.Tick()
        
        for sequence in self.sequences:
            if sequence is not None:
                sequence.Execute()
        
        CheckDeathNPC(self)
        
        self.interaction.Execute()
        
