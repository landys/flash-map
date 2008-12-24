class com.ammap.Labels
{
    var __scene_labels_mc, __map_labels_mc, __map_mc, __data, __label_data, __config, __labels_to_resize, __bg_to_resize, data_source, useHandCursor;
    function Labels(target_mc, map_mc, name, depth, label_data, config, data)
    {
        AsBroadcaster.initialize(this);
        __scene_labels_mc = target_mc.createEmptyMovieClip(name, depth);
        __map_labels_mc = map_mc.createEmptyMovieClip("labels_mc", 3);
        __map_mc = map_mc;
        __data = data;
        __label_data = label_data;
        __config = config;
        __labels_to_resize = new Array();
        __bg_to_resize = new Array();
        this.__init(false);
    } // End of the function
    function __init(upper_levels)
    {
        var main_obj = this;
        for (var _loc5 = 0; _loc5 < __label_data.labels.label.length; ++_loc5)
        {
            if (upper_levels == true && __label_data.labels.label[_loc5].remain == false)
            {
                continue;
            } // end if
            if (__label_data.labels.label[_loc5].text != undefined)
            {
                var _loc2 = __label_data.labels.label[_loc5];
                if (isNaN(_loc2.lat) && isNaN(_loc2.long))
                {
                    var _loc7 = __scene_labels_mc;
                    var _loc9 = com.ammap.Utils.getCoordinate(_loc2.x, __config.width);
                    var _loc13 = com.ammap.Utils.getCoordinate(_loc2.y, __config.height);
                }
                else
                {
                    _loc7 = __map_labels_mc;
                    _loc9 = com.ammap.Utils.longitudeToPixels(__config.projection, _loc2.long, __data.tl_long, __data.br_long, __config.map_width);
                    _loc13 = com.ammap.Utils.latitudeToPixels(__config.projection, _loc2.lat, __data.tl_lat, __data.br_lat, __config.map_height);
                } // end else if
                var _loc8 = _loc7.getNextHighestDepth();
                var _loc6 = _loc7.createEmptyMovieClip("label_container_mc" + _loc8, _loc8);
                var _loc3 = _loc6.createEmptyMovieClip("label_mc", 2);
                _loc6._x = _loc9;
                _loc6._y = _loc13;
                var _loc12 = com.ammap.Utils.getCoordinate(_loc2.width, __config.width);
                if (isNaN(_loc12) == true)
                {
                    _loc12 = __config.width - _loc9;
                } // end if
                var _loc4 = new com.ammap.Text(_loc3, "label", 0, 0, 0, _loc12, __config.height, "left", __config);
                _loc4.size = _loc2.text_size;
                _loc4.color = _loc2.color;
                _loc4.htmlTxt = _loc2.text;
                _loc4.align = _loc2.align;
                _loc3.data_source = _loc2;
                if (_loc4.textWidth < _loc4.width && _loc2.width == undefined)
                {
                    _loc4.width = _loc4.textWidth + 5;
                } // end if
                if (_loc2.rotate == true)
                {
                    _loc4 = com.ammap.Utils.rotateText(_loc3.label, __config.background.color, _loc3, "label", 1);
                } // end if
                if (_loc2.bg_color != undefined && _loc2.bg_alpha != 0)
                {
                    var _loc11 = new com.ammap.Rectangle(_loc6, "bg_mc", 1, _loc4.field._width + __config.label.bg_margins_horizontal, _loc4.field._height + __config.label.bg_margins_vertical, _loc2.bg_color, 0, 0, 0, _loc2.bg_alpha, 0);
                    _loc4.x = __config.label.bg_margins_horizontal / 2;
                    _loc4.y = __config.label.bg_margins_vertical / 2;
                } // end if
                if (_loc7._parent == __map_mc && _loc2.fixed_size == true)
                {
                    __labels_to_resize.push(_loc4);
                    __bg_to_resize.push(_loc11.mc);
                } // end if
                _loc3.onRollOver = function ()
                {
                    main_obj.broadcastMessage("onRollOver", data_source);
                    if (data_source.color_hover != undefined)
                    {
                        var _loc2 = new Color(this);
                        _loc2.setRGB(data_source.color_hover);
                    } // end if
                    if (com.ammap.Utils.checkIfClickable(data_source) != true)
                    {
                        useHandCursor = false;
                    } // end if
                };
                _loc3.onRollOut = _loc3.onReleaseOutside = function ()
                {
                    main_obj.broadcastMessage("onRollOut", data_source);
                    if (data_source.color_hover != undefined)
                    {
                        var _loc2 = new Color(this);
                        _loc2.setRGB(data_source.color);
                    } // end if
                };
                if (com.ammap.Utils.checkIfClickable(_loc2) == true)
                {
                    _loc3.onRelease = function ()
                    {
                        main_obj.broadcastMessage("onGetURL", data_source);
                    };
                } // end if
            } // end if
        } // end of for
        if (__label_data.parent != __label_data)
        {
            __label_data = __label_data.parent;
            this.__init(true);
        } // end if
    } // End of the function
    function resize(scale)
    {
        for (var _loc2 = 0; _loc2 < __labels_to_resize.length; ++_loc2)
        {
            __labels_to_resize[_loc2].field._xscale = scale;
            __labels_to_resize[_loc2].field._yscale = scale;
            if (__bg_to_resize[_loc2] != undefined)
            {
                __labels_to_resize[_loc2].x = __config.label.bg_margins_horizontal / 2 * scale / 100;
                __labels_to_resize[_loc2].y = __config.label.bg_margins_vertical / 2 * scale / 100;
                __bg_to_resize[_loc2]._width = __labels_to_resize[_loc2].field._width + __config.label.bg_margins_horizontal * scale / 100;
                __bg_to_resize[_loc2]._height = __labels_to_resize[_loc2].field._height + __config.label.bg_margins_vertical * scale / 100;
            } // end if
        } // end of for
    } // End of the function
} // End of Class
