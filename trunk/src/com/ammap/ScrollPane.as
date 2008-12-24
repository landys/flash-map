class com.ammap.ScrollPane
{
    var __corner_radius, __mc, __width, __height, __color, __alpha, __scroll_pane_mc, __content_mc, __scroller_bg_mc, __scroller_mc, __short_lines_mc, startDrag, __listener, __height_real, __scroller_height, __bg_mc, __get__width, __get__bg_mc, __get__contentWidth, __get__content_mc, __get__height, __get__mc, __get__scrollerVisible, __get__scrollerWidth, __set__width;
    function ScrollPane(target_mc, name, depth, width, height, color, alpha, corner_radius)
    {
        AsBroadcaster.initialize(this);
        __corner_radius = corner_radius;
        __mc = target_mc.createEmptyMovieClip(name, depth);
        __width = width - 1;
        __height = height - 1;
        __color = color;
        __alpha = alpha;
    } // End of the function
    function __init()
    {
        var main_obj = this;
        __scroll_pane_mc = __mc.createEmptyMovieClip("scroll_pane_mc", 10);
        __content_mc = __scroll_pane_mc.createEmptyMovieClip("content_mc", 0);
        var _loc6 = new com.ammap.Rectangle(__scroll_pane_mc, "scroller_bg_mc", 20, __scroller_width, __height, __scroller_bg_color, 0, 0, 0, 100, 0);
        __scroller_bg_mc = _loc6.mc;
        __scroller_bg_mc._x = __width - __scroller_width - __border_width;
        var _loc7 = new com.ammap.Rectangle(__scroll_pane_mc, "scroller_mc", 30, __scroller_width, __height, __scroller_color, 0, 0, 0, 100, 0);
        __scroller_mc = _loc7.mc;
        __scroller_mc._x = __width - __scroller_width - __border_width;
        __short_lines_mc = __scroll_pane_mc.createEmptyMovieClip("short_lines_mc", 35);
        __short_lines_mc._x = __scroller_mc._x;
        for (var _loc4 = 0; _loc4 < 4; ++_loc4)
        {
            var _loc5 = new com.ammap.Line(__short_lines_mc, "line_mc" + _loc4, _loc4, [__scroller_width * 2.000000E-001, __scroller_width * 8.000000E-001], [0, 0], 0, __border_color);
            _loc5.mc._y = _loc4 * 3;
        } // end of for
        __scroller_mc.onPress = function ()
        {
            this.startDrag(0, main_obj.__scroller_mc._x, 0, main_obj.__scroller_mc._x, main_obj.__scroller_bg_mc._height - main_obj.__scroller_mc._height);
            main_obj.__scrolling = true;
            main_obj.broadcastMessage("onDragStart");
            _global.drag_busy = main_obj;
        };
        __scroller_mc.onRelease = __scroller_mc.onReleaseOutside = function ()
        {
            main_obj.__scrolling = false;
            stopDrag ();
            main_obj.broadcastMessage("onDragStop");
            _global.drag_busy = "";
        };
        __listener = new Object();
        __listener.onMouseMove = function ()
        {
            if (main_obj.__scrolling == true)
            {
                main_obj.__updatePosition();
            } // end if
        };
        __listener.onMouseWheel = function (delta)
        {
            if (main_obj.__scroller_mc._visible == true && main_obj.__bg_mc.hitTest(_root._xmouse, _root._ymouse) == true && (_global.wheel_busy == main_obj || _global.wheel_busy == false))
            {
                _global.wheel_busy = main_obj;
                if (main_obj.__scroller_mc._y >= 0)
                {
                    main_obj.__scroller_mc._y = main_obj.__scroller_mc._y - delta;
                } // end if
                if (main_obj.__scroller_mc._y <= main_obj.__scroller_bg_mc._height - main_obj.__scroller_mc._height)
                {
                    main_obj.__scroller_mc._y = main_obj.__scroller_mc._y - delta;
                } // end if
                if (main_obj.__scroller_mc._y < 0)
                {
                    main_obj.__scroller_mc._y = 0;
                } // end if
                if (main_obj.__scroller_mc._y > main_obj.__scroller_bg_mc._height - main_obj.__scroller_mc._height)
                {
                    main_obj.__scroller_mc._y = main_obj.__scroller_bg_mc._height - main_obj.__scroller_mc._height;
                } // end if
                main_obj.__updatePosition();
            }
            else
            {
                _global.wheel_busy = false;
            } // end else if
        };
        Mouse.addListener(__listener);
        this.__resize();
    } // End of the function
    function __resize()
    {
        var _loc2 = this;
        if (__height > __content_mc._height)
        {
            __height_real = __content_mc._height;
        }
        else
        {
            __height_real = __height;
        } // end else if
        _loc2 = this;
        __content_mc._height;
        __scroller_height = __height_real * __height_real / __content_mc._height;
        __scroller_height = com.ammap.Utils.fitToBounds(__scroller_height, 15, __height_real);
        if (__scroller_height == __height_real)
        {
            __scroller_mc._visible = false;
            __scroller_bg_mc._visible = false;
            __short_lines_mc._visible = false;
            _loc2.broadcastMessage("scrollable", false);
        }
        else
        {
            __scroller_mc._visible = true;
            __scroller_bg_mc._visible = true;
            __short_lines_mc._visible = true;
            _loc2.broadcastMessage("scrollable", true);
        } // end else if
        __scroller_mc._height = __scroller_height;
        __short_lines_mc._y = (__scroller_mc._height - 8) / 2;
        var _loc5 = new com.ammap.Rectangle(__mc, "border_mc", 100, __width, __height_real, __color, __border_width, __border_color, __corner_radius, 0, __border_alpha);
        var _loc3 = new com.ammap.Rectangle(__mc, "bg_mc", 0, __width, __height_real, __color, 0, __color, __corner_radius, __alpha, 0);
        __bg_mc = _loc3.mc;
        var _loc4 = new com.ammap.Rectangle(__scroll_pane_mc, "mask_mc1", 200, __width, __height_real, 0, __border_width, 0, __corner_radius);
        __content_mc.setMask(_loc4.mc);
        _loc4 = new com.ammap.Rectangle(__scroll_pane_mc, "mask_mc2", 210, __width, __height_real, 0, __border_width, 0, __corner_radius);
        __scroller_mc.setMask(_loc4.mc);
        _loc4 = new com.ammap.Rectangle(__scroll_pane_mc, "mask_mc3", 220, __width, __height_real, 0, __border_width, 0, __corner_radius);
        __scroller_bg_mc.setMask(_loc4.mc);
    } // End of the function
    function __updatePosition()
    {
        __content_mc._y = -__scroller_mc._y * ((__content_mc._height - __height) / (__height - __scroller_mc._height));
        __short_lines_mc._y = __scroller_mc._y + (__scroller_mc._height - 8) / 2;
    } // End of the function
    function set width(param)
    {
        __width = param;
        this.__init();
        //return (this.width());
        null;
    } // End of the function
    function get mc()
    {
        return (__mc);
    } // End of the function
    function get bg_mc()
    {
        return (__bg_mc);
    } // End of the function
    function get content_mc()
    {
        return (__content_mc);
    } // End of the function
    function get scrollerVisible()
    {
        return (__scroller_mc._visible);
    } // End of the function
    function get scrollerWidth()
    {
        return (__scroller_mc._width);
    } // End of the function
    function get height()
    {
        return (__height_real);
    } // End of the function
    function get contentWidth()
    {
        if (__scroller_mc._visible == true)
        {
            return (__width - __scroller_width - 10);
        }
        else
        {
            return (__width);
        } // end else if
    } // End of the function
    function border(color, alpha, width)
    {
        __border_alpha = alpha;
        __border_color = color;
        __border_width = width;
    } // End of the function
    function scroller(color, bg_color)
    {
        __scroller_color = color;
        __scroller_bg_color = bg_color;
    } // End of the function
    function show()
    {
        this.__init();
    } // End of the function
    function hide()
    {
        removeMovieClip (__mc);
    } // End of the function
    function update()
    {
        this.__resize();
    } // End of the function
    function die()
    {
        Mouse.removeListener(__listener);
    } // End of the function
    var __border_width = 0;
    var __border_color = 0;
    var __border_alpha = 50;
    var __scroller_width = 18;
    var __scroller_color = 929388;
    var __scroller_bg_color = 14342874;
} // End of Class
