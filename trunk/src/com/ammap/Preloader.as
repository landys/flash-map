class com.ammap.Preloader
{
    var __loader, __text, __width, __height, __bg_color, __mc, useHandCursor, __bar_width, __bar_x, __bar_y, __bar, __label, __interval, __get__showInfo, __get__mc, __set__showInfo;
    function Preloader(target_mc, name, depth, loader, width, height, color, bgColor, text)
    {
        __loader = loader;
        __text = text;
        __width = width;
        __height = height;
        if (color != undefined)
        {
            __color = color;
        } // end if
        __bg_color = bgColor;
        if (__text == undefined)
        {
            __text = "";
            __separator = "";
        } // end if
        __mc = target_mc.createEmptyMovieClip(name, depth);
        this.__init();
    } // End of the function
    function __init()
    {
        var _loc2 = new com.ammap.Rectangle(__mc, "bg_mc", 0, __width, __height, __bg_color);
        if (__bg_color == undefined || __bg_color == null)
        {
            _loc2.mc._alpha = 0;
        } // end if
        _loc2.mc.onRollOver = function ()
        {
            useHandCursor = false;
        };
        __bar_width = __width / 2;
        __bar_x = (__width - __bar_width) / 2;
        __bar_y = (__height - __bar_height) / 2;
        var _loc3 = new com.ammap.Rectangle(__mc, "outline_mc", 1, __bar_width, __bar_height, null, 1, __color);
        _loc3.mc._x = __bar_x;
        _loc3.mc._y = __bar_y;
        __bar = new com.ammap.Rectangle(__mc, "bar_mc", 2, __bar_width, __bar_height - 1, __color);
        __bar.__get__mc()._x = __bar_x;
        __bar.__get__mc()._y = __bar_y;
        __bar.__get__mc()._width = 0;
        if (__text != "" || __show_info == true)
        {
            __label = new com.ammap.Text(__mc, "label", 3, __bar_x, __bar_x, __bar_width);
            __label.__set__txt(__text);
            __label.__set__color(__color);
            __label.x = __label.x - 2;
            __label.__set__y(__bar_y - __label.__get__textHeight() - 3);
        } // end if
        __interval = setInterval(this, "updateBar", 50);
    } // End of the function
    function updateBar()
    {
        var _loc2 = Math.round(__loader.getBytesLoaded() / __loader.getBytesTotal() * 100);
        if (isNaN(_loc2))
        {
            _loc2 = 0;
        } // end if
        var _loc3 = __loader.getBytesTotal();
        if (_loc3 == undefined)
        {
            _loc3 = 0;
        } // end if
        if (__show_info == true)
        {
            __label.__set__txt(__text + __separator + _loc2 + "% / " + Math.round(_loc3 / 1024) + " kb");
            __label.__set__y(__bar_y - __label.__get__textHeight() - 3);
        } // end if
        __bar.__get__mc()._width = __bar_width * _loc2 / 100;
    } // End of the function
    function set showInfo(param)
    {
        __show_info = param;
        //return (this.showInfo());
        null;
    } // End of the function
    function remove()
    {
        clearInterval(__interval);
        if (__mc != undefined)
        {
            removeMovieClip (__mc);
        } // end if
    } // End of the function
    function get mc()
    {
        return (__mc);
    } // End of the function
    var __bar_height = 5;
    var __color = 0;
    var __show_info = true;
    var __separator = ": ";
} // End of Class
