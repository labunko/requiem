#include <MsgBoxConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>

While 1
HotKeySet('{ESC}','_out');Exitkey - Esc
WinWaitActive("Requiem")

MouseClickDrag("left", 1746, 602, 335, 180, 10); Тащим шмотку
mclick(357, 290); Auto Register
mclick(447, 290); Ok
mclick(535, 328); Card choose2
mclick(555, 530)

WEnd


Func mclick($mx, $my)
	MouseMove($mx, $my)
	Sleep(100)
	MouseDown("left")
	Sleep(100)
	MouseUp("left")
	Sleep(500)
EndFunc
Func _out()
	Exit
EndFunc