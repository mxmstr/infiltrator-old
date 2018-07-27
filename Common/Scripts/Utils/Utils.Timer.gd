import time


class Timer:
    
    def __init__(self, name, duration, countdown=False):
        
        self.name = name
        self.duration = duration
        self.countdown = countdown
        self.last = time.time()
        self.paused = False
        
        
    def Tick(self):
        
        if not self.paused:
            
            now = time.time()
            delta = now - self.last
            
            if self.countdown:
                self.duration -= delta
                if self.duration < 0.0:
                    self.duration = 0.0
                    return True
            else:
                if delta > self.duration:
                    self.last = now
                    return True
        
        return False
    
    
    def Pause(self):
        
        self.paused = True
        
    
    def Continue(self):
        
        self.paused = False