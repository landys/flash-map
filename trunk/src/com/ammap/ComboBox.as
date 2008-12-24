class com.ammap.ComboBox
{
    var __type, __mc, __width, __height, __item_names, __item_values, __item_colors, __bg_color, __bg_alpha, __corner_radius, __text_size, __text_color, __text_color_selected, __text_color_hover, __border_color, __border_width, __border_alpha, __scroller_color, __scroller_bg_color, __bg_color_selected, __bg_color_hover, __count, __listener, __button, __icon, __drop_down, __item_button, broadcastMessage, __get__icon, __get__height, __set__icon, __get__mc;
    function ComboBox(target_mc, name, depth, width, height, type, style)
    {
        AsBroadcaster.initialize(this);
        __type = type;
        __mc = target_mc.createEmptyMovieClip(name, depth);
        __width = width;
        __height = height;
        __item_names = new Array();
        __item_values = new Array();
        __item_colors = new Array();
        __bg_color = style.color;
        __bg_alpha = style.alpha;
        __corner_radius = style.corner_radius;
        __text_size = style.text_size;
        __text_color = style.text_color;
        __text_color_selected = style.text_color_selected;
        __text_color_hover = style.text_color_hover;
        __border_color = style.border_color;
        __border_width = 0;
        __border_alpha = style.border_alpha;
        __scroller_color = style.scroller_color;
        __scroller_bg_color = style.scroller_bg_color;
        __bg_color_selected = style.bg_color_selected;
        __bg_color_hover = style.bg_color_hover;
        __count = -1;
    } // End of the function
    function __init()
    {
        var main_obj = this;
        var _loc6 = 0;
        if (__type == "dropdown")
        {
            __listener = new Object();
            __listener.onMouseUp = function ()
            {
                if (main_obj.__drop_down.bg_mc.hitTest(_xmouse, _ymouse) == false && main_obj.__button.mc.hitTest(_xmouse, _ymouse) == false)
                {
                    main_obj.__hideDropDown();
                } // end if
            };
            Mouse.addListener(__listener);
            __button = new com.ammap.Button(__mc, "button_mc", 2, __item_names[__selected_item], __width);
            if (__icon != undefined)
            {
                __button.attachIcon(__icon, __item_colors[__selected_item]);
            } // end if
            __button.__set__wrap(false);
            __button.__set__textSize(__text_size);
            __button.__set__cornerRadius(__corner_radius);
            __button.__set__vPadding(3);
            __button.__set__hPadding(5);
            __button.__set__borderColor(__border_color);
            __button.__set__borderColorActive(__border_color);
            __button.__set__borderColorHover(__border_color);
            __button.__set__borderColorPushedHover(__border_color);
            __button.__set__borderColorPushed(__border_color);
            __button.__set__textColor(__text_color);
            __button.__set__textColorActive(__text_color);
            __button.__set__textColorHover(__text_color);
            __button.__set__textColorPushedHover(__text_color);
            __button.__set__textColorPushed(__text_color);
            __button.__set__bgColor(__bg_color);
            __button.__set__bgColorActive(__bg_color);
            __button.__set__bgColorHover(__bg_color);
            __button.__set__bgColorPushed(__bg_color);
            __button.__set__bgColorPushedHover(__bg_color);
            __button.__set__bgAlpha(__bg_alpha);
            __button.__set__bgAlphaActive(__bg_alpha);
            __button.__set__bgAlphaHover(__bg_alpha);
            __button.__set__bgAlphaPushed(__bg_alpha);
            __button.__set__bgAlphaPushedHover(__bg_alpha);
            __button.__set__borderAlpha(__border_alpha);
            __button.__set__borderWidth(__border_width);
            __button.__set__textAlign("left");
            __button.__set__pushable(true);
            __button.__set__unpushable(true);
            __button.arrow("bottom", __border_color);
            __button.show();
            var _loc5 = new Object();
            _loc5.onPush = function ()
            {
                _global.wheel_busy = main_obj.__drop_down;
                main_obj.__showDropDown();
            };
            _loc5.onUnpush = function ()
            {
                main_obj.__hideDropDown();
            };
            __button.addListener(_loc5);
            _loc6 = __button.__get__mc()._height;
        } // end if
        __drop_down = new com.ammap.ScrollPane(__mc, "dropdown_mc", 1, __width + 1, __height - _loc6, __bg_color, __bg_alpha, __corner_radius);
        __drop_down.scroller(__scroller_color, __scroller_bg_color);
        __drop_down.border(__border_color, __border_alpha, __border_width);
        __drop_down.show();
        var _loc7 = new Object();
        _loc7.scrollable = function (param)
        {
            main_obj.__resizeItems(param);
        };
        __drop_down.addListener(_loc7);
        var _loc4 = new Object();
        _loc4.onPush = function (index)
        {
            main_obj.__selectItem(index);
        };
        _loc4.onUnpush = function (index)
        {
            main_obj.__deselectItem(index);
        };
        _loc4.onRollOver = function (index)
        {
            _global.wheel_busy = main_obj.__drop_down;
            main_obj.broadcastMessage("onRollOver", main_obj.__item_values[index]);
        };
        _loc4.onRollOut = function (index)
        {
            main_obj.broadcastMessage("onRollOut", main_obj.__item_values[index]);
        };
        __item_button = new Array();
        for (var _loc3 = 0; _loc3 < __item_names.length; ++_loc3)
        {
            __item_button[_loc3] = new com.ammap.Button(__drop_down.__get__content_mc(), "dropdown_item_mc" + _loc3, _loc3, __item_names[_loc3], __width);
            __item_button[_loc3].wrap = false;
            __item_button[_loc3].textSize = __text_size;
            __item_button[_loc3].pushable = true;
            if (__type == "list")
            {
                __item_button[_loc3].unpushable = true;
            } // end if
            if (__icon != undefined)
            {
                __item_button[_loc3].attachIcon(__icon, __item_colors[_loc3]);
            } // end if
            __item_button[_loc3].textAlign = "left";
            __item_button[_loc3].vPadding = 3;
            __item_button[_loc3].borderWidth = 0;
            __item_button[_loc3].hPadding = 5;
            __item_button[_loc3].cornerRadius = 0;
            __item_button[_loc3].borderAlpha = 0;
            __item_button[_loc3].textColor = __text_color;
            __item_button[_loc3].textColorActive = __text_color;
            __item_button[_loc3].textColorHover = __text_color_hover;
            __item_button[_loc3].textColorPushed = __text_color_selected;
            __item_button[_loc3].textColorPushedHover = __text_color_selected;
            __item_button[_loc3].bgAlpha = 0;
            __item_button[_loc3].bgAlphaHover = 100;
            __item_button[_loc3].bgAlphaSelected = 100;
            __item_button[_loc3].bgColor = __bg_color;
            __item_button[_loc3].bgColorActive = __bg_color;
            __item_button[_loc3].bgColorHover = __bg_color_hover;
            __item_button[_loc3].bgColorPushed = __bg_color_selected;
            __item_button[_loc3].bgColorPushedHover = __bg_color_selected;
            __item_button[_loc3].index = _loc3;
            __item_button[_loc3].show();
            __item_button[_loc3].mc._y = __item_button[_loc3].mc._height * _loc3;
            __item_button[_loc3].addListener(_loc4);
        } // end of for
        __drop_down.update();
        if (__type == "dropdown")
        {
            __drop_down.__get__mc()._y = __button.__get__mc()._height - __border_width;
            this.__hideDropDown();
        } // end if
    } // End of the function
    function __selectItem(index, broadcast)
    {
        __selected_item = index;
        __button.__set__txt(__item_names[index]);
        if (__icon != undefined)
        {
            __button.__set__iconColor(__item_colors[__selected_item]);
            __item_button[__selected_item].changeIcon(true);
        } // end if
        if (__type == "dropdown")
        {
            this.__hideDropDown();
        } // end if
        for (var _loc2 = 0; _loc2 < __item_names.length; ++_loc2)
        {
            if (_loc2 != __selected_item)
            {
                __item_button[_loc2].pushed = false;
            } // end if
        } // end of for
        __item_button[index].pushed = true;
        if (broadcast != false)
        {
            this.broadcastMessage("onChange", __item_values[index]);
            this.broadcastMessage("onSelect", __item_values[index]);
        } // end if
    } // End of the function
    function itemSelected(index, param)
    {
        __item_button[index].pushed = param;
    } // End of the function
    function valueSelected(value, param)
    {
        for (var _loc2 = 0; _loc2 < __item_values.length; ++_loc2)
        {
            if (__item_values[_loc2] == value)
            {
                __item_button[_loc2].pushed = param;
                if (__icon != undefined)
                {
                    __item_button[_loc2].changeIcon(param);
                } // end if
            } // end if
        } // end of for
    } // End of the function
    function __deselectItem(index)
    {
        if (__icon != undefined)
        {
            __item_button[index].changeIcon(false);
        } // end if
        this.broadcastMessage("onDeselect", index, __item_names[index], __item_values[index]);
    } // End of the function
    function __resizeItems(scrollable)
    {
        if (scrollable == true)
        {
            var _loc3 = __width - __scroller_width;
        }
        else
        {
            _loc3 = __width;
        } // end else if
        for (var _loc2 = 0; _loc2 < __item_names.length; ++_loc2)
        {
            __item_button[_loc2].hitAreaWidth = _loc3;
        } // end of for
    } // End of the function
    function __showDropDown()
    {
        __drop_down.__get__mc()._visible = true;
    } // End of the function
    function __hideDropDown()
    {
        _global.wheel_busy = false;
        __button.__set__pushed(false);
        __drop_down.__get__mc()._visible = false;
    } // End of the function
    function addItem(name, value, selected_color)
    {
        __item_names.push(name);
        __item_values.push(value);
        __item_colors.push(selected_color);
        ++__count;
        return (__count);
    } // End of the function
    function selectItem(index)
    {
        this.__selectItem(index, false);
    } // End of the function
    function get mc()
    {
        return (__mc);
    } // End of the function
    function show()
    {
        this.__init();
    } // End of the function
    function get height()
    {
        if (__type == "dropdown")
        {
            //return (__button.height());
        }
        else
        {
            //return (__drop_down.height());
        } // end else if
    } // End of the function
    function set icon(param)
    {
        __icon = param;
        //return (this.icon());
        null;
    } // End of the function
    function die()
    {
        Mouse.removeListener(__listener);
        __drop_down.die();
    } // End of the function
    var __selected_item = 0;
    var __scroller_width = 18;
} // End of Class
