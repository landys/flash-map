class com.ammap.NavigationPath
{
    var __mc, __config, __count, __get__mc;
    function NavigationPath(target_mc, name, depth, config)
    {
        AsBroadcaster.initialize(this);
        __mc = target_mc.createEmptyMovieClip(name, depth);
        __config = config;
        __count = 0;
        __mc._x = com.ammap.Utils.getCoordinate(__config.navigation_path.x, __config.width);
        __mc._y = com.ammap.Utils.getCoordinate(__config.navigation_path.y, __config.height);
    } // End of the function
    function __init(data_source)
    {
        var main_obj = this;
        var _loc6 = data_source.title;
        if (__count > 0 && _loc6 != "")
        {
            _loc6 = _loc6 + __config.navigation_path.separator;
        } // end if
        var _loc4 = new com.ammap.Button(__mc, "path_button_mc" + __count, __count, _loc6);
        _loc4.cornerRadius = 0;
        _loc4.borderWidth = 0;
        _loc4.borderAlpha = 0;
        _loc4.bgAlpha = _loc4.bgAlphaHover = _loc4.bgAlphaActive = __config.navigation_path.alpha;
        _loc4.bgColor = _loc4.bgColorHover = _loc4.bgColorActive = __config.navigation_path.color;
        _loc4.hPadding = __config.navigation_path.padding;
        _loc4.vPadding = 1;
        _loc4.textColor = __config.navigation_path.text_color;
        _loc4.font = __config.font;
        _loc4.textColorHover = __config.navigation_path.text_color_hover;
        _loc4.textSize = __config.navigation_path.text_size;
        _loc4.bold = true;
        if (__count == 0)
        {
            _loc4.textUnderline = true;
        } // end if
        _loc4.show();
        _loc4.data_source = data_source;
        var _loc8 = new Object();
        _loc8.press = function (evtObj)
        {
            main_obj.broadcastMessage("onClick", evtObj.target.data_source);
        };
        _loc4.addEventListener("press", _loc8);
        if (__count > 0)
        {
            var _loc5 = 0;
            for (var _loc2 = __count - 1; _loc2 > -1; --_loc2)
            {
                var _loc3 = __mc["path_button_mc" + (_loc2 + 1)]._width + __mc["path_button_mc" + (_loc2 + 1)]._x + 1;
                if (__mc["path_button_mc" + _loc2]._width + _loc3 > __config.width - __mc._x)
                {
                    _loc3 = 0;
                    ++_loc5;
                } // end if
                __mc["path_button_mc" + _loc2]._x = _loc3;
                __mc["path_button_mc" + _loc2]._y = _loc5 * (__config.navigation_path.text_size + 10);
            } // end of for
        } // end if
        if (data_source.parent != data_source)
        {
            ++__count;
            this.__init(data_source.parent);
        } // end if
    } // End of the function
    function registerClick(data_source)
    {
        this.clearPath();
        __count = 0;
        this.__init(data_source);
    } // End of the function
    function clearPath()
    {
        for (var _loc2 in __mc)
        {
            removeMovieClip (__mc[_loc2]);
        } // end of for...in
    } // End of the function
    function get mc()
    {
        return (__mc);
    } // End of the function
} // End of Class
