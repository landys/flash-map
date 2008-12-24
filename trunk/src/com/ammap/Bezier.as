class com.ammap.Bezier
{
    var __mc, __get__mc;
    function Bezier(target_mc, name, depth, x, y, width, color, alpha, fill_alpha)
    {
        if (alpha == undefined)
        {
            alpha = 100;
        } // end if
        __mc = target_mc.createEmptyMovieClip(name, depth);
        if (fill_alpha > 0)
        {
            __mc.beginFill(color, fill_alpha);
        } // end if
        __mc.lineStyle(width, color, alpha, true, "none");
        __mc.moveTo(x[0], y[0]);
        var _loc5 = new Array();
        for (var _loc2 = 0; _loc2 < x.length; ++_loc2)
        {
            _loc5.push({x: x[_loc2], y: y[_loc2]});
        } // end of for
        var _loc6 = this.__interpolate(_loc5);
        this.__drawBeziers(__mc, _loc6);
    } // End of the function
    function __interpolate(points)
    {
        var _loc4 = [];
        _loc4.push({x: points[0].x, y: points[0].y});
        var _loc8 = points[1].x - points[0].x;
        var _loc7 = points[1].y - points[0].y;
        _loc4.push({x: points[0].x + _loc8 / 6, y: points[0].y + _loc7 / 6});
        for (var _loc3 = 1; _loc3 < points.length - 1; ++_loc3)
        {
            var _loc5 = points[_loc3 - 1];
            var _loc1 = points[_loc3];
            var _loc6 = points[_loc3 + 1];
            _loc8 = _loc6.x - _loc5.x;
            _loc7 = _loc6.y - _loc5.y;
            _loc4.push({x: _loc1.x - _loc8 / 6, y: _loc1.y - _loc7 / 6});
            _loc4.push({x: _loc1.x, y: _loc1.y});
            _loc4.push({x: _loc1.x + _loc8 / 6, y: _loc1.y + _loc7 / 6});
        } // end of for
        _loc7 = points[points.length - 1].y - points[points.length - 2].y;
        _loc8 = points[points.length - 1].x - points[points.length - 2].x;
        _loc4.push({x: points[points.length - 1].x - _loc8 / 6, y: points[points.length - 1].y - _loc7 / 6});
        _loc4.push({x: points[points.length - 1].x, y: points[points.length - 1].y});
        return (_loc4);
    } // End of the function
    function __drawBeziers(mc, interpolated_points)
    {
        for (var _loc2 = 0; _loc2 < (interpolated_points.length - 1) / 3; ++_loc2)
        {
            this.__drawBezierMidpoint(mc, interpolated_points[3 * _loc2], interpolated_points[3 * _loc2 + 1], interpolated_points[3 * _loc2 + 2], interpolated_points[3 * _loc2 + 3]);
        } // end of for
    } // End of the function
    function __drawBezierMidpoint(mc, P0, P1, P2, P3)
    {
        var _loc8 = this.__getPointOnSegment(P0, P1, 7.500000E-001);
        var _loc7 = this.__getPointOnSegment(P3, P2, 7.500000E-001);
        var _loc11 = (P3.x - P0.x) / 16;
        var _loc10 = (P3.y - P0.y) / 16;
        var _loc6 = this.__getPointOnSegment(P0, P1, 3.750000E-001);
        var _loc3 = this.__getPointOnSegment(_loc8, _loc7, 3.750000E-001);
        _loc3.x = _loc3.x - _loc11;
        _loc3.y = _loc3.y - _loc10;
        var _loc2 = this.__getPointOnSegment(_loc7, _loc8, 3.750000E-001);
        _loc2.x = _loc2.x + _loc11;
        _loc2.y = _loc2.y + _loc10;
        var _loc5 = this.__getPointOnSegment(P3, P2, 3.750000E-001);
        var _loc14 = this.__getMiddle(_loc6, _loc3);
        var _loc13 = this.__getMiddle(_loc8, _loc7);
        var _loc12 = this.__getMiddle(_loc2, _loc5);
        mc.curveTo(_loc6.x, _loc6.y, _loc14.x, _loc14.y);
        mc.curveTo(_loc3.x, _loc3.y, _loc13.x, _loc13.y);
        mc.curveTo(_loc2.x, _loc2.y, _loc12.x, _loc12.y);
        mc.curveTo(_loc5.x, _loc5.y, P3.x, P3.y);
    } // End of the function
    function __getPointOnSegment(P0, P1, ratio)
    {
        return ({x: P0.x + (P1.x - P0.x) * ratio, y: P0.y + (P1.y - P0.y) * ratio});
    } // End of the function
    function __getMiddle(P0, P1)
    {
        return ({x: (P0.x + P1.x) / 2, y: (P0.y + P1.y) / 2});
    } // End of the function
    function get mc()
    {
        return (__mc);
    } // End of the function
} // End of Class
