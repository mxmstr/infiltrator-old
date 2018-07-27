from Common.Script.Utils.Timer import Timer
from Common.Script.AI.Event.Result.Result import AI_Result



class PASS(AI_Result):
    
    def __init__(self, result_, parent_, type_, exit_):
        
        super().__init__(result_, parent_, type_, exit_)
        
        
    def StartEventResult(self, own):
        
        self.ApplyResultAttributes(own)
        self.NextResultNode(own, True)