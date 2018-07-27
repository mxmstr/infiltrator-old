from Common.Script.Interaction.Interaction import Interaction
from Common.Script.Actor.Actions import *
from Common.Script.Animation.Sequence import Sequence


class Interactive(types.KX_GameObject):
    
    def __init__(self, own):
        
        self.sequences = []
        
        self.properties = None
        self.delta_velocity = 0.0
        
        if 'interactive' in self:
            self.interaction_preset = self['interactive']
            self.interaction_default = self['default']
        else:
            self.interaction_preset = 'Pass'
            self.interaction_default = 'Default'
            
        self.interaction = Interaction(self.interaction_preset, self)
        self.interaction.ChangeState(None, self.interaction_default, None)
        
        Globals.EventManager.InteractiveList.append(self)


    def StartSequence(self, name, reverse, overwrite):
        
        if overwrite or not SequenceExists(self, name):
            sequence = Sequence(self, name, reverse)
            self.sequences[sequence.layer - 1] = sequence


    def main(self):
        
        self.delta_velocity = self.worldLinearVelocity.length
        
        for sequence in self.sequences:
            if sequence is not None:
                sequence.Execute()
        
        self.interaction.Execute()
        
        