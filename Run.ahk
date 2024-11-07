#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

filePath := A_ScriptDir "\WRITEHERE.txt"  ; File path

XArray := []    ; Initialize array for the x-coordinates
YArray := []    ; Initialize array for the y-coordinates

Loop, read, %filePath%
{
    line := A_LoopReadLine
    lineCount := A_Index
    if(lineCount = 1 || lineCount = 2 || lineCount = 4 || lineCount = 5 || lineCount = 6){
        continue    ; Skip the comments in the txt file
    }
    if(lineCount = 3){
        scroll := StrSplit(line, " ")  ; Split line by spaces into array 'scroll'
    }
    if(lineCount = 7 || lineCount = 8 || lineCount = 9){
        numbers := StrSplit(line, " ")  ; Split line to get x and y coordinates
        XArray.Push(numbers[1])
        YArray.Push(numbers[2])
    }
}

#n::
    for index, element in scroll{
        MouseMove, XArray[1], YArray[1]
        Loop %element%{
            Send, {WheelDown}
            Sleep, 100
        }
        Sleep, 1000
        Send, {LButton}
        Sleep, 5000
        MouseMove, XArray[2], YArray[2]
        Send, {LButton}
        Sleep, 10000
        Loop, 30{
            Send, {Right}
            Send, {Right}
            Sleep, 7000
        }
        Send, ^w
        Sleep, 2000
        MouseMove, XArray[3], YArray[3]
        Send, {LButton}
        Sleep, 7000
    }
return