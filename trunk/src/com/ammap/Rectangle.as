class com.ammap.Rectangle
{
    var __target_mc, __name, __depth, __width, __height, __bg_color, __border_width, __border_color, __mc, __get__mc;
    function Rectangle(target_mc, name, depth, width, height, bg_color, border_width, border_color, corner_radius, bg_alpha, border_alpha)
    {
        __target_mc = target_mc;
        __name = name;
        __depth = depth;
        __width = width;
        __height = height;
        __bg_color = bg_color;
        __border_width = border_width;
        __border_color = border_color;
        __corner_radius = corner_radius !== undefined ? (corner_radius) : (__corner_radius);
        __bg_alpha = bg_alpha !== undefined ? (bg_alpha) : (__bg_alpha);
        __border_alpha = border_alpha !== undefined ? (border_alpha) : (__border_alpha);
        this.__show();
    } // End of the function
    function get mc()
    {
        return (__mc);
    } // End of the function
    function __show()
    {
        var _loc6 = __width;
        var _loc5 = __height;
        var _loc3 = 0;
        var _loc2 = 0;
        var _loc4 = __corner_radius;
        if (__border_width > 1)
        {
            var _loc7 = Math.ceil(__border_width / 2);
            _loc3 = _loc3 + _loc7;
            _loc2 = _loc2 + _loc7;
            _loc6 = _loc6 - __border_width;
            _loc5 = _loc5 - __border_width;
        } // end if
        if (__border_width == 1)
        {
            _loc6 = _loc6 - 1;
            _loc5 = _loc5 - 1;
        } // end if
        __mc = __target_mc.createEmptyMovieClip(__name, __depth);
        if (__border_width == undefined || __border_width == null)
        {
            __mc.lineStyle(0, __bg_color, __border_alpha);
        }
        else
        {
            __mc.lineStyle(__border_width, __border_color, __border_alpha);
        } // end else if
        if (__bg_color != undefined || __bg_color != null)
        {
            __mc.beginFill(__bg_color, __bg_alpha);
        } // end if
        __mc.moveTo(_loc3 + _loc4, _loc2);
        __mc.lineTo(_loc6 + _loc3 - _loc4, _loc2);
        if (_loc4 > 0)
        {
            __mc.curveTo(_loc6 + _loc3, _loc2, _loc6 + _loc3, _loc2 + _loc4);
        } // end if
        __mc.lineTo(_loc6 + _loc3, _loc5 + _loc2 - _loc4);
        if (_loc4 > 0)
        {
            __mc.curveTo(_loc6 + _loc3, _loc5 + _loc2, _loc6 + _loc3 - _loc4, _loc5 + _loc2);
        } // end if
        __mc.lineTo(_loc3 + _loc4, _loc5 + _loc2);
        if (_loc4 > 0)
        {
            __mc.curveTo(_loc3, _loc5 + _loc2, _loc3, _loc5 + _loc2 - _loc4);
        } // end if
        __mc.lineTo(_loc3, _loc2 + _loc4);
        if (_loc4 > 0)
        {
            __mc.curveTo(_loc3, _loc2, _loc3 + _loc4, _loc2);
        } // end if
        if (__bg_color != undefined || __bg_color != null)
        {
            __mc.endFill();
        } // end if
    } // End of the function
    var __corner_radius = 0;
    var __bg_alpha = 100;
    var __border_alpha = 100;
} // End of Class
