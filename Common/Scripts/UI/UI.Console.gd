from bge import logic, events, types
from Common.Script.Actor.Actions import KeyHit
from Common.Script.Globals import EventManager



class Console(types.KX_FontObject):
    
    def __init__(self, own):
        
        self['log'] = False
        self['input'] = ''
        self.scroll_timer = 0.0
        self.lines = [''] * 4
        
        self.main = self.Visible
        #self.toggleVisible()
        
        EventManager.UIHandlerList.append(self)
        
    def Output(self, text):
        
        self.lines.pop(0)
        self.lines.append(text)
        
    def InputStream(self):
        
        self.lines[-1] = '>> ' + self['input'].strip()
        self.text = '\n'.join(self.lines) 
        
    def AppendStream(self, text):
        
        self.lines[-1] = text.strip()
        self.text = '\n'.join(self.lines)
        
    def ScrollStream(self):
        
        input = self.lines[-1]
        
        self.lines.pop(0)
        self.lines.pop(-1)
        self.lines.append('')
        self.lines.append(input)
        
    def ToggleVisible(self):
        
        #self.visible = not self.visible
        self['log'] = not self['log']
        
        #if self.main == self.state_visible:
        #    self.main = self.state_hidden
        #else:
        #    self.main = self.state_visible
    
    #states    
    def Visible(self):
        
        self.scroll_timer += (1.0 / 60) * (logic.getLogicTicRate()/60)
        if self.scroll_timer > 2.0:
            self.ScrollStream()
            self.scroll_timer = 0.0
        
        if KeyHit(events.ENTERKEY):
            self.Output('')
            self['input'] = ''
        elif KeyHit(events.ACCENTGRAVEKEY):
            #self['input'] = self['input'][:-1]
            self.ToggleVisible()
            
        if not self['append'] == '':
            self['input'] = self['append']
            self.InputStream()
            self.Output('')
            self['input'] = ''
            self['append'] = ''
            
        self.InputStream()
        
    def Hidden(self):
        
        if KeyHit(events.ACCENTGRAVEKEY):
            self.ToggleVisible()       

