package;

#if windows
@:buildXml('
<target id="haxe">
	<lib name="dwmapi.lib" if="windows" />
</target>
')

@:cppFileCode('
#include "dwmapi.h"
#include "winuser.h"

#define WM_SETICON 0x0080

HICON hWindowIcon = NULL;
HICON hWindowIconBig = NULL;
')
#end
class WinAPI {
    #if windows
    @:functionCode('
    HWND window = FindWindowA(NULL, title.c_str());
	if (window == NULL) 
        window = FindWindowExA(GetActiveWindow(), NULL, NULL, title.c_str());

    int value = enabled ? 1 : 0;

    if (window != NULL) {
        DwmSetWindowAttribute(window, 20, &value, sizeof(value));

        ShowWindow(window, 0);
        ShowWindow(window, 1);
        SetFocus(window);
    }
    ')
    #end
    public static function setDarkMode(title:String, enabled:Bool):Void {}

    #if windows
    @:functionCode('
    HWND window = FindWindowA(NULL, title.c_str());
	if (window == NULL) 
        window = FindWindowExA(GetActiveWindow(), NULL, NULL, title.c_str());

    if (window != NULL) {
        if(hWindowIcon!=NULL)
           DestroyIcon(hWindowIcon);
        if(hWindowIconBig!=NULL)
           DestroyIcon(hWindowIconBig);

        if (stricon.c_str() == "")
        {
            SendMessage( window, WM_SETICON, ICON_SMALL, (LPARAM)NULL );
            SendMessage( window, WM_SETICON, ICON_BIG, (LPARAM)NULL );
        }
        else
        {
            hWindowIcon = (HICON)LoadImage(NULL, stricon.c_str(), IMAGE_ICON, 16, 16, LR_LOADFROMFILE);
            hWindowIconBig =(HICON)LoadImage(NULL, stricon.c_str(), IMAGE_ICON, 32, 32, LR_LOADFROMFILE);
            SendMessage( window, WM_SETICON, ICON_SMALL, (LPARAM)hWindowIcon );
            SendMessage( window, WM_SETICON, ICON_BIG, (LPARAM)hWindowIconBig );
        }
    }
    ')
    #end
	public static function setIcon(title:String, stricon:String):Void {}
}