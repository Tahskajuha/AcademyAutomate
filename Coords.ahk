#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^LButton::
    MouseGetPos, mouseX, mouseY  ; Get the current mouse position
    MsgBox, The current mouse coordinates are: X = %mouseX%, Y = %mouseY%
return