#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=D:\Soft\AutoIt Script\�������\2GISLauncher\Icon.ico
#AutoIt3Wrapper_UseX64=n
#AutoIt3Wrapper_Res_requestedExecutionLevel=asInvoker
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#cs ----------------------------------------------------------------------------
 AutoIt Version: 3.3.8.1
 Author:         myName
 Script Function:
	Template AutoIt script.
#ce ----------------------------------------------------------------------------
Opt("WinDetectHiddenText", 1)

Dim $i
$i = 0

;~ ��������� �����..
Run("grym.exe", @ScriptDir, @SW_HIDE)

;~ ���� ������ ��������� ������� ���������� ����..
While 1
    Sleep(10)
    If WinExists("[REGEXPTITLE:.*\��������� �������������� ������� 2���]") Then
		WinMove("[REGEXPTITLE:.*\��������� �������������� ������� 2���]", "", @DesktopWidth, @DesktopHeight)
        WinClose("[REGEXPTITLE:.*\��������� �������������� ������� 2���]")  ; � ��������� ��� ��� ���������
		Sleep(100)
		If Not WinExists("[REGEXPTITLE:.*\��������� �������������� ������� 2���]") Then ExitLoop ; ���� ��� ������� (��������) �� ������� �� ����� ����� ��������
    Else
		if $i = 6000 Then
			MsgBox(0,"msg", "�����������..") ; ����������� - ��������� ������ �������
		EndIf
		$i = $i + 1
    EndIf
WEnd

;~ ���� ������ ��������� ���������� ���������� ����..
While 1
	Sleep(10)
    If WinExists("2���") Then
		WinSetTrans("2���","", 0)
        WinClose("2���") ; � ��������� ��� ��� ���������
		Sleep(1000)
		If Not WinExists("2���") Then
			ProcessClose("2GISTrayNotifier.exe")
			ExitLoop ; ���� ��� ������� (��������) �� ������� �� ����� ����� ��������
		EndIf
	Else
		if Not WinExists("[REGEXPTITLE:.*\ - 2���]") Then
			Sleep(4000)
			if Not WinExists("[REGEXPTITLE:.*\ - 2���]") Then
				ExitLoop ; ��������� ������� �� ��������� - ��������� ������ �������
			EndIf
		EndIf
    EndIf
WEnd
