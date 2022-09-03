#include <MsgBoxConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

HotKeySet('{ESC}','_out');клавиша выхода - Esc
WinWaitActive("Requiem")

Local $action, $redcount
$redcount = 0


While 1

$gui = GUICreate("Hello", 300, 200, 0, 500, -1, $WS_EX_TOPMOST)
GUISetState(@SW_SHOW)
GUICtrlCreateLabel("Переработано: " & $redcount, 10, 10)

;~ Закупка
While PixelGetColor(1656,977) = 1574659
	MouseClick("left", 441, 175, 2, 10)
	Sleep(50)
WEnd

Sleep(1000)


;~ 968 277 0xAAAAAA
;~ Открываем переработку
While Hex(PixelGetColor(968,277), 6) <> "AAAAAA"
	MouseClick("left", 843, 1031, 2, 10)
WEnd

;~ 626 240 160C0B
While Hex(PixelGetColor(626,240), 6) <> "160C0B"
	MouseMove(960, 278)
	MouseDown("left")
	Sleep(50)
	MouseUp("left")
	Sleep(500)
WEnd


;~ Разбираем 3 сумки
For $bag=1 To 3 Step 1
For $x=1 To 5 Step 1
	For $y=1 To 5 Step 1
		GUICtrlCreateLabel("Переработано: " & $redcount, 10, 10)
;~ 		MouseClickDrag("left", 1670+40*$x, 560+40*$y, 242, 193)
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
;~ Сумка4 1625 562 411617
;~ Сумка3 1626 794 411617
;~ Сумка2 1813 330 411617

MouseMove(1861, 562)
Sleep(100)

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

;~ Разбираем остатки в 4й сумке, если есть
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

;~ Открываем 3 сумки
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

;~ Закрываем окно переработки

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

