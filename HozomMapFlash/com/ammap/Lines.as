class com.ammap.Lines
{
    var __scene_lines_mc, __map_lines_mc, __map_mc, __data, __line_data, __config, __arrows_to_resize;
    function Lines(target_mc, map_mc, name, depth, line_data, config, data)
    {
        __scene_lines_mc = target_mc.createEmptyMovieClip(name, depth);
        __map_lines_mc = map_mc.createEmptyMovieClip("lines_mc", 2);
        __map_mc = map_mc;
        __data = data;
        __line_data = line_data;
        __config = config;
        __arrows_to_resize = new Array();
        this.__init();
    } // End of the function
    function __init(upper_levels)
    {
        for (var _loc8 = 0; _loc8 < __line_data.lines.line.length; ++_loc8)
        {
            if (upper_levels == true && __line_data.lines.line[_loc8].remain == false)
            {
                continue;
            } // end if
            var _loc3 = __line_data.lines.line[_loc8];
            if (_loc3.long == undefined && _loc3.lat == undefined)
            {
                var _loc6 = __scene_lines_mc;
                var _loc2 = com.ammap.Utils.getCoordinateFromArray(_loc3.x, __config.width);
                var _loc4 = com.ammap.Utils.getCoordinateFromArray(_loc3.y, __config.height);
            }
            else
            {
                _loc6 = __map_lines_mc;
                _loc2 = com.ammap.Utils.longitudeToPixels(__config.projection, _loc3.long, __data.tl_long, __data.br_long, __config.map_width);
                _loc4 = com.ammap.Utils.latitudeToPixels(__config.projection, _loc3.lat, __data.tl_lat, __data.br_lat, __config.map_height);
            } // end else if
            var _loc5 = _loc6.getNextHighestDepth();
            if (_loc3.curved == true)
            {
                var _loc11 = new com.ammap.Bezier(_loc6, "line" + _loc5, _loc5, _loc2, _loc4, _loc3.width, _loc3.color);
            }
            else if (_loc3.dashed == true)
            {
                _loc11 = new com.ammap.DashedLine(_loc6, "line" + _loc5, _loc5, _loc2, _loc4, _loc3.width, 5, _loc3.color);
            }
            else
            {
                _loc11 = new com.ammap.Line(_loc6, "line" + _loc5, _loc5, _loc2, _loc4, _loc3.width, _loc3.color);
            } // end else if
            _loc11.mc._alpha = _loc3.alpha;
            if (_loc3.arrow != undefined)
            {
                _loc5 = _loc6.getNextHighestDepth();
                var _loc7 = _loc6.createEmptyMovieClip("arrow_mc" + _loc5, _loc5);
                var _loc9 = _loc7.attachMovie("arrow_mc", "arrow_mc", 0);
                _loc9._width = _loc3.arrow_size;
                _loc9._height = _loc3.arrow_size;
                if (_loc3.arrow == "end" || _loc3.arrow == "both")
                {
                    _loc7._x = _loc2[_loc2.length - 1];
                    _loc7._y = _loc4[_loc4.length - 1];
                    _loc7._rotation = Math.atan((_loc4[_loc4.length - 1] - _loc4[_loc4.length - 2]) / (_loc2[_loc2.length - 1] - _loc2[_loc2.length - 2])) * 180 / 3.141593E+000;
                    if (_loc2[_loc2.length - 1] - _loc2[_loc2.length - 2] < 0)
                    {
                        _loc7._rotation = _loc7._rotation + 180;
                    } // end if
                } // end if
                if (_loc3.arrow == "middle")
                {
                    _loc7._x = _loc2[_loc2.length - 2] + (_loc2[_loc2.length - 1] - _loc2[_loc2.length - 2]) / 2;
                    _loc7._y = _loc4[_loc4.length - 2] + (_loc4[_loc4.length - 1] - _loc4[_loc4.length - 2]) / 2;
                    _loc7._rotation = Math.atan((_loc4[_loc4.length - 1] - _loc4[_loc4.length - 2]) / (_loc2[_loc2.length - 1] - _loc2[_loc2.length - 2])) * 180 / 3.141593E+000;
                    if (_loc2[_loc2.length - 1] - _loc2[_loc2.length - 2] < 0)
                    {
                        _loc7._rotation = _loc7._rotation + 180;
                    } // end if
                } // end if
                if (_loc3.arrow == "start")
                {
                    _loc7._x = _loc2[0];
                    _loc7._y = _loc4[0];
                    _loc7._rotation = Math.atan((_loc4[1] - _loc4[0]) / (_loc2[1] - _loc2[0])) * 180 / 3.141593E+000;
                    if (_loc2[1] - _loc2[0] < 0)
                    {
                        _loc7._rotation = _loc7._rotation + 180;
                    } // end if
                } // end if
                if (_loc6._parent == __map_mc && _loc3.fixed_size == true)
                {
                    __arrows_to_resize.push(_loc7);
                    _loc7._visible = false;
                } // end if
                var _loc10 = new Color(_loc7);
                _loc10.setRGB(_loc3.arrow_color);
                _loc7._alpha = _loc3.arrow_alpha;
                if (_loc3.arrow == "both")
                {
                    _loc5 = _loc6.getNextHighestDepth();
                    _loc7 = _loc6.createEmptyMovieClip("arrow_mc" + _loc5, _loc5);
                    _loc9 = _loc7.attachMovie("arrow_mc", "arrow_mc", 0);
                    _loc9._width = _loc3.arrow_size;
                    _loc9._height = _loc3.arrow_size;
                    _loc7._x = _loc2[0];
                    _loc7._y = _loc4[0];
                    _loc7._rotation = Math.atan((_loc4[1] - _loc4[0]) / (_loc2[1] - _loc2[0])) * 180 / 3.141593E+000;
                    if (_loc2[1] - _loc2[0] < 0)
                    {
                        _loc7._rotation = _loc7._rotation + 180;
                    } // end if
                    _loc7._rotation = _loc7._rotation + 180;
                    if (_loc6._parent == __map_mc && _loc3.fixed_size == true)
                    {
                        __arrows_to_resize.push(_loc7);
                        _loc7._visible = false;
                    } // end if
                    _loc10 = new Color(_loc7);
                    _loc10.setRGB(_loc3.arrow_color);
                    _loc7._alpha = _loc3.arrow_alpha;
                } // end if
            } // end if
        } // end of for
        if (__line_data.parent != __line_data)
        {
            __line_data = __line_data.parent;
            this.__init(true);
        } // end if
    } // End of the function
    function arrowsToResize()
    {
        return (__arrows_to_resize);
    } // End of the function
} // End of Class
