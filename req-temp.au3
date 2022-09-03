#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Form1", 595, 144, 192, 124)
$Label1 = GUICtrlCreateLabel("Переработано", 32, 24, 77, 17)
$Label2 = GUICtrlCreateLabel("$redcount", 136, 32, 52, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

		Case $Label1
	EndSwitch
WEnd
