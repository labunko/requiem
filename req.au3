#include <MsgBoxConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

HotKeySet('{ESC}','_out');Exitkey - Esc
WinWaitActive("Requiem")

Local $redcount
$redcount = 0 ; Count of reductioned items

While 1

;~Open window
$gui = GUICreate("Hello", 300, 200, 0, 500, -1, $WS_EX_TOPMOST)
GUISetState(@SW_SHOW)
GUICtrlCreateLabel("Переработано: " & $redcount, 10, 10)

;~Buying necklace
While Hex(PixelGetColor(1631,991), 6) <> "100808"
	MouseClick("left", 441, 175, 2, 10)
	Sleep(50)
WEnd

If Hex(PixelGetColor(1660,608), 6) = "ACCDD5" Then
	While Hex(PixelGetColor(1696, 608), 6) <> "0A0A0A"
		MouseClick("right", 1660, 608)
	WEnd
	While Hex(PixelGetColor(1660,608), 6) = "ACCDD5"
		MouseClick("left", 1736, 620)
	WEnd
EndIf

Sleep(1000)

;~ Open reduction tool
While Hex(PixelGetColor(968,277), 6) <> "AAAAAA"
	MouseClick("left", 843, 1031, 2, 10)
WEnd

While Hex(PixelGetColor(626,240), 6) <> "160C0B"
	MouseMove(960, 278)
	MouseDown("left")
	Sleep(50)
	MouseUp("left")
	Sleep(500)
WEnd

;~ Start reduction for 3 bags
For $bag=1 To 3 Step 1
For $x=1 To 5 Step 1
	For $y=1 To 5 Step 1
		GUICtrlCreateLabel("Переработано: " & $redcount, 10, 10)
		MouseMove(1670+40*$x, 560+40*$y)
		Sleep(50)
		MouseDown("left")
		Sleep(50)
		MouseMove(242, 193)
		Sleep(50)
		MouseUp("left")

		Sleep(100)

		MouseMove(230, 364)
		MouseDown("left")
		Sleep(50)
		MouseUp("left")
		Sleep(500)

		$redcount += 1
		GUICtrlCreateLabel("Переработано: " & $redcount, 10, 10)
	Next
Next

MouseMove(1861, 562)
Sleep(100)

;~Closing bags
Select
	Case $bag = 1
		While Hex(PixelGetColor(1625,562), 6) = "411617"
			MouseDown("left")
			Sleep(100)
			MouseUp("left")
			Sleep(500)
		WEnd

	Case $bag = 2
		While Hex(PixelGetColor(1626,794), 6) = "411617"
			MouseDown("left")
			Sleep(100)
			MouseUp("left")
			Sleep(500)
		WEnd

	Case $bag = 3
		While Hex(PixelGetColor(1813,330), 6) = "411617"
			MouseDown("left")
			Sleep(100)
			MouseUp("left")
			Sleep(500)
		WEnd
EndSelect
Next

;~Reduction bag 4
While Not @error
	$coord = PixelSearch(1698, 587, 1869, 615, 0xACCDD5)
	If Not @error Then
		MouseClickDrag("left", $coord[0], $coord[1], 242, 193)
		MouseMove(230, 364)
		MouseDown("left")
		Sleep(50)
		MouseUp("left")
		Sleep(500)

		$redcount += 1
		GUICtrlCreateLabel("Переработано: " & $redcount, 10, 10)
	EndIf
WEnd

;~ Open three bags and reduction tool
While Hex(PixelGetColor(1813,330), 6) <> "411617"
	MouseMove(1788, 1024)
	Sleep(100)
	MouseDown("left")
	Sleep(100)
	MouseUp("left")
	Sleep(500)
WEnd

While Hex(PixelGetColor(1626,794), 6) <> "411617"
	MouseMove(1825, 1024)
	Sleep(100)
	MouseDown("left")
	Sleep(100)
	MouseUp("left")
	Sleep(500)
WEnd

While Hex(PixelGetColor(1625,562), 6) <> "411617"
	MouseMove(1855, 1024)
	Sleep(100)
	MouseDown("left")
	Sleep(100)
	MouseUp("left")
	Sleep(500)
WEnd

While Hex(PixelGetColor(139,232), 6) = "000000"
	MouseMove(732, 115)
	Sleep(100)
	MouseDown("left")
	Sleep(100)
	MouseUp("left")
	Sleep(500)
WEnd

WEnd

Func _out()
	Exit
EndFunc