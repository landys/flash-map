class com.ammap.PopUp
{
    var __x, __y, __mc, __get__mc;
    function PopUp(target_mc, name, depth, message, x, y, width, bg_color, text_color)
    {
        __bg_color = bg_color;
        __text_color = text_color;
        __width = width;
        __x = x;
        __y = y;
        __mc = target_mc.createEmptyMovieClip(name, depth);
        this.__init(message);
    } // End of the function
    function __init(message)
    {
        var _loc2 = new com.ammap.Text(__mc, "popup_text", 10, __x + __margins, __y + __margins, __width - 2 * __margins);
        _loc2.txt = message;
        _loc2.color = __text_color;
        _loc2.align = "center";
        var _loc4 = 2 * __margins + _loc2.textHeight;
        var _loc3 = new com.ammap.Rectangle(__mc, "bg", 0, __width, _loc4, __bg_color);
        _loc3.mc._x = __x;
        _loc3.mc._y = __y;
    } // End of the function
    function get mc()
    {
        return (__mc);
    } // End of the function
    function remove()
    {
        removeMovieClip (__mc);
    } // End of the function
    var __bg_color = 16777215;
    var __width = 300;
    var __text_color = 0;
    var __margins = 15;
} // End of Class
