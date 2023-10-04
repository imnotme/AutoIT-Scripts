#include <File.au3>


;set "Escape" key as an emergency stop
HotKeySet("{ESCAPE}", "_emergencyExit")


Func _emergencyExit()
	Exit (64)
EndFunc

;WinActivate("[CLASS:Notepad]")
;WinWaitActive("[CLASS:Notepad]")

WinActivate("WhatsApp")
WinWaitActive("WhatsApp")
Opt("SendKeyDelay", 15)

;Source file, can be any TXT file. Choose a LOOOOOOONG one, google this one if not inspired.
$infile = FileOpen(".\res\files\Lord-of-the-Rings-Fellowship-of-the-Ring,-The.txt",$FO_READ)

While True
	Send(FileReadLine($infile))
	Sleep(25)
	Send("{ENTER}")
	Sleep (50)
WEnd
