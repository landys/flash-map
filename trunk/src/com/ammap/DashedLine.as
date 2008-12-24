class com.ammap.DashedLine
{
    var __mc, __get__mc;
    function DashedLine(target_mc, name, depth, x, y, width, dash_length, color)
    {
        __mc = target_mc.createEmptyMovieClip(name, depth);
        for (var _loc3 = 1; _loc3 < x.length; ++_loc3)
        {
            var _loc7 = __mc.createEmptyMovieClip("dashedLine", _loc3);
            _loc7._x = x[_loc3 - 1];
            _loc7._y = y[_loc3 - 1];
            var _loc4 = Math.sqrt(Math.pow(x[_loc3] - x[_loc3 - 1], 2) + Math.pow(y[_loc3] - y[_loc3 - 1], 2)) / dash_length;
            var _loc5 = (x[_loc3] - x[_loc3 - 1]) / _loc4;
            var _loc6 = (y[_loc3] - y[_loc3 - 1]) / _loc4;
            for (var _loc2 = 1; _loc2 < _loc4; _loc2 = _loc2 + 2)
            {
                var _loc10 = new com.ammap.Line(_loc7, "line" + _loc2, _loc2, [(_loc2 - 1) * _loc5, _loc2 * _loc5], [(_loc2 - 1) * _loc6, _loc2 * _loc6], width, color);
            } // end of for
        } // end of for
    } // End of the function
    function get mc()
    {
        return (__mc);
    } // End of the function
} // End of Class
