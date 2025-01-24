LeaveOnWithMouse


Windows Registry Editor Version 5.00

; Tutorial: https://www.tenforums.com/tutorials/111633-disable-touchpad-when-mouse-connected-windows-10-a.html


[HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\PrecisionTouchPad]
"LeaveOnWithMouse"=dword:00000000



;Add Ability to pause updates for 1 year
[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings]
"FlightSettingsMaxPauseDays"=dword:0000016c


