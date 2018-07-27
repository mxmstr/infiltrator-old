#Scene_Main = next((x for x in logic.getSceneList() if x.name == 'Main'), None)
#Scene_VM = next((x for x in logic.getSceneList() if x.name == 'ViewModel'), None)
#Scene_UI = next((x for x in logic.getSceneList() if x.name == 'UI'), None)
#Scene_Console = next((x for x in logic.getSceneList() if x.name == 'Console'), None)

extends Node

const Base_Speed = 300.0
const Walk_Mult = 1.0
const Run_Mult = 1.5
const Crouch_Mult = 0.8
const Prone_Mult = 0.0
const Throw_Force = 400.0
const Throw_Angular = 3.0

const Range_None = 0.0
const Range_Infinite = 250.0
    
const SightRange_Close = 2.0
const SightRange_Normal = 5.0
const SightRange_Suspicious = 8.0
const SightRange_Alert = 12.0

const SoundRange_Close = 1.5
const SoundRange_Normal = 5.0
const SoundRange_Suspicious = 8.0
const SoundRange_Alert = 12.0

