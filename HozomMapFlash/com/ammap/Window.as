class com.ammap.Window
{
    var __mc, __width, __height, __color, __alpha, __corner_radius, __title_txt, __scroll_pane_width, __text_size, __text_color, __scroll_pane_height, __close_mc, __close_button_color, __bg_mc, __scroll_pane, __scroll_pane_mc, __content_mc, __text, __html_text, useHandCursor, __get__height, __get__width, __get__margin_width, __get__content, __close_button_color_hover, __locked, __get__locked, __set__content, __set__height, __set__locked, __set__margin_width, __get__mc, __set__width;
    function Window(target_mc, name, depth, title, width, height, color, alpha, corner_radius)
    {
        AsBroadcaster.initialize(this);
        __mc = target_mc.createEmptyMovieClip(name, depth);
        __width = width - 1;
        __height = height - 1;
        __color = color;
        __alpha = alpha;
        __corner_radius = corner_radius;
        __title_txt = title;
    } // End of the function
    function __init()
    {
        var main_obj = this;
        __scroll_pane_width = __width - __margin_width * 2 - __border_width * 2;
        if (__title_txt == undefined)
        {
            __title_txt = "";
        } // end if
        var _loc3 = new com.ammap.Text(__mc, "title_tf", 5, __border_width + __margin_width, __border_width + __margin_width, __scroll_pane_width - 15);
        _loc3.size = __text_size;
        _loc3.color = __text_color;
        _loc3.bold = true;
        _loc3.txt = __title_txt;
        _loc3.height;
        __scroll_pane_height = __height - __margin_width * 2 - __border_width * 2 - _loc3.height - 5;
        __close_mc = __mc.attachMovie("x_mc", "x_mc", 80);
        __close_mc._x = __border_width + __margin_width + __scroll_pane_width - __scroller_width - 2;
        __close_mc._y = __border_width + __margin_width;
        var _loc8 = new Color(__close_mc);
        _loc8.setRGB(__close_button_color);
        __close_mc.onRelease = function ()
        {
            main_obj.__mc._visible = false;
        };
        __close_mc.onRollOver = function ()
        {
            var _loc2 = new Color(this);
            _loc2.setRGB(main_obj.__close_button_color_hover);
        };
        __close_mc.onRollOut = __close_mc.onReleaseOutside = function ()
        {
            var _loc2 = new Color(this);
            _loc2.setRGB(main_obj.__close_button_color);
        };
        var _loc5 = new com.ammap.Rectangle(__mc, "bg_mc", 1, __width, __height, __color, __border_width, __border_color, __corner_radius, __alpha, __border_alpha);
        __bg_mc = _loc5.mc;
        var _loc4 = new com.ammap.Rectangle(__mc, "shadow_mc", 0, __width, __height, __shadow_color, 0, 0, __corner_radius, __shadow_alpha, 0);
        _loc4.mc._x = __shadow_distance;
        _loc4.mc._y = __shadow_distance;
        var _loc7 = new flash.filters.BlurFilter(__shadow_blur, __shadow_blur, 5);
        var _loc6 = new Array();
        _loc6.push(_loc7);
        _loc4.mc.filters = _loc6;
        __scroll_pane = new com.ammap.ScrollPane(__mc, "scroll_pane_mc", 10, __scroll_pane_width, __scroll_pane_height, 0, 0);
        __scroll_pane.scroller(__scroller_color, __scroller_bg_color);
        __scroll_pane.border(__scroller_bg_color, 0, 0);
        __scroll_pane.show();
        __scroll_pane_mc = __scroll_pane.mc;
        __scroll_pane_mc._x = __border_width + __margin_width;
        __scroll_pane_mc._y = __border_width + __margin_width + 5 + _loc3.height;
        __content_mc = __scroll_pane.content_mc;
        __text = new com.ammap.Text(__content_mc, "text_tf", 0, 0, 0, __scroll_pane_width - __scroll_pane.scrollerWidth - 10);
        __text.__set__size(__text_size);
        __text.__set__color(__text_color);
        __text.__set__htmlTxt(__html_text);
        __text.__set__selectable(true);
        __text.__get__field().onSetFocus = function ()
        {
            _global.drag_busy = main_obj;
        };
        __text.__get__height();
        __scroll_pane.update();
        __bg_mc.onPress = function ()
        {
            if (main_obj.__locked != true)
            {
                startDrag (main_obj.__mc, false);
            } // end if
            _global.drag_busy = main_obj;
        };
        __bg_mc.onRelease = _loc5.mc.onReleaseOutside = function ()
        {
            stopDrag ();
            _global.drag_busy = false;
        };
        __bg_mc.onRollOver = function ()
        {
            _global.wheel_busy = main_obj.__scroll_pane;
            useHandCursor = false;
        };
        if (__scroll_pane.scrollerVisible == false)
        {
            __text.__set__width(__scroll_pane_width - 10);
        } // end if
    } // End of the function
    function set height(param)
    {
        __height = param;
        this.__init();
        //return (this.height());
        null;
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
    function border(color, alpha, width)
    {
        __border_alpha = alpha;
        __border_color = color;
        __border_width = width;
    } // End of the function
    function scroller(color, bg_color, width)
    {
        __scroller_color = color;
        __scroller_bg_color = bg_color;
        __scroller_width = width;
    } // End of the function
    function set margin_width(param)
    {
        __margin_width = param;
        //return (this.margin_width());
        null;
    } // End of the function
    function text(size, color)
    {
        __text_size = size;
        __text_color = color;
    } // End of the function
    function set content(param)
    {
        __html_text = param;
        //return (this.content());
        null;
    } // End of the function
    function show()
    {
        this.__init();
    } // End of the function
    function shadow(color, alpha, blur, distance)
    {
        __shadow_alpha = alpha;
        __shadow_color = color;
        __shadow_blur = blur;
        __shadow_distance = distance;
    } // End of the function
    function closeButton(color, color_hover)
    {
        __close_button_color = color;
        __close_button_color_hover = color_hover;
    } // End of the function
    function hideX()
    {
        __close_mc._visible = false;
    } // End of the function
    function set locked(param)
    {
        __locked = param;
        //return (this.locked());
        null;
    } // End of the function
    function die()
    {
        __scroll_pane.die();
    } // End of the function
    var __border_width = 0;
    var __border_color = 0;
    var __border_alpha = 50;
    var __shadow_alpha = 50;
    var __shadow_blur = 5;
    var __shadow_distance = 5;
    var __shadow_color = 0;
    var __margin_width = 10;
    var __scroller_width = 16;
    var __scroller_color = 929388;
    var __scroller_bg_color = 14342874;
} // End of Class
