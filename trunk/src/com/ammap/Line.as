class com.ammap.Line
{
    var __mc, __get__mc;
    function Line(target_mc, name, depth, x, y, width, color, alpha)
    {
        if (alpha == undefined)
        {
            alpha = 100;
        } // end if
        __mc = target_mc.createEmptyMovieClip(name, depth);
        __mc.lineStyle(width, color, alpha, true, "none");
        __mc.moveTo(x[0], y[0]);
        for (var _loc2 = 1; _loc2 < x.length; ++_loc2)
        {
            __mc.lineTo(x[_loc2], y[_loc2]);
        } // end of for
    } // End of the function
    function get mc()
    {
        return (__mc);
    } // End of the function
} // End of Class
