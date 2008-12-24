class com.ammap.Button extends com.ammap.SimpleButton
{
    var __text, __icon_id, __mc, __icon_mc, __border_width, __icon_color, __width, __height, __label, __text_font, __text_bold, __text_size, __arrow_width, __arrow, __border_alpha, __arrow_color, __border_color, __get__iconColor, __get__hPadding, __get__vPadding, __get__txt, __get__wrap, __get__bold, __get__textSize, __get__textAlign, __get__font, __get__textUnderline, __get__textColor, __get__textUnderlineHover, __get__textColorHover, __get__textUnderlineActive, __get__textColorActive, __get__textUnderlinePushed, __get__textColorPushed, __get__textUnderlinePushedHover, __get__textColorPushedHover, __get__arrowWidth, __set__bold, __set__font, __set__hPadding, __set__iconColor, __get__label, __set__textAlign, __set__textColor, __set__textColorActive, __set__textColorHover, __set__textColorPushed, __set__textColorPushedHover, __set__textSize, __set__textUnderline, __set__textUnderlineActive, __set__textUnderlineHover, __set__textUnderlinePushed, __set__textUnderlinePushedHover, __set__txt, __set__vPadding, __set__wrap;
    function Button(target_mc, name, depth, text, width, height)
    {
        super(target_mc, name, depth, width, height);
        __text = text;
    } // End of the function
    function __init()
    {
        var _loc3 = 0;
        var _loc6 = 0;
        var _loc5 = 0;
        if (__icon_id != undefined)
        {
            __icon_mc = __mc.attachMovie(__icon_id, "icon", __icon_depth);
            __icon_mc._x = __h_padding + __border_width + 2;
            __icon_mc._y = __v_padding + __border_width + 2;
            _loc3 = __icon_mc._width;
            _loc6 = __icon_mc._height;
            _loc5 = __icon_spacing;
            var _loc9 = new Color(__icon_mc);
            _loc9.setRGB(__icon_color);
        } // end if
        if (__text != "" && __text != undefined)
        {
            if (__width != undefined)
            {
                var _loc8 = __width - 2 * (__h_padding + __border_width) - _loc3 - __icon_spacing;
            }
            else
            {
                _loc8 = 0;
            } // end else if
            if (__height != undefined)
            {
                var _loc11 = __height - 2 * (__h_padding + __border_width);
            }
            else
            {
                _loc11 = 0;
            } // end else if
            var _loc15 = __h_padding + __border_width + _loc3 + _loc5;
            var _loc12 = __border_width + __v_padding;
            var _loc10 = __mc.createEmptyMovieClip("label_mc", __text_depth);
            __label = new com.ammap.Text(_loc10, "label", 0, _loc15, _loc12, _loc8, _loc11);
            __label.__set__color(__text_color);
            __label.__set__font(__text_font);
            __label.__set__underline(__text_underline);
            __label.__set__wrap(__wrap);
            if (__text_bold != undefined)
            {
                __label.__set__bold(__text_bold);
            } // end if
            __label.__set__size(__text_size);
            __label.__set__align(__text_align);
            __label.__set__htmlTxt(__text);
            if (__height > __label.__get__textHeight())
            {
                __label.__set__y((__height - __label.__get__textHeight()) / 2 - 2);
            } // end if
        } // end if
        __arrow_width = 0;
        if (__arrow != undefined)
        {
            var _loc7 = __mc.createEmptyMovieClip("arrow_mc", __arrow_depth);
            if (__arrow == "bottom")
            {
                var _loc14 = [0, 8, 4, 0];
                var _loc13 = [0, 0, 4, 0];
            } // end if
            if (__arrow == "top")
            {
                _loc14 = [0, 8, 4, 0];
                _loc13 = [4, 4, 0, 4];
            } // end if
            var _loc4 = new com.ammap.Shape(_loc7, "arrow_mc", 1, _loc14, _loc13, __arrow_color, 0, 0, __border_alpha, 0);
            __arrow_width = 18;
        } // end if
        if (__width == undefined)
        {
            __width = 2 * (__h_padding + __border_width) + _loc3 + __arrow_width;
            __width = __width + (__label.__get__textWidth() + 2);
            if (__text != "" && __text != undefined)
            {
                __width = __width + _loc5;
            } // end if
        } // end if
        if (__height == undefined)
        {
            __label.__get__height();
            if (__label.__get__height() > _loc6)
            {
                __height = 2 * (__v_padding + __border_width) + __label.__get__height();
            }
            else
            {
                __height = 2 * (__v_padding + __border_width) + _loc6;
            } // end if
        } // end else if
        if (__arrow != undefined)
        {
            var _loc16 = new com.ammap.Line(_loc7, "line_mc", 2, [__border_width / 2, __border_width / 2], [__border_width, __height - __border_width], __border_width, __border_color, __border_alpha);
            _loc7._x = __width - __arrow_width - 2 * __border_width;
            _loc4.mc._y = (__height - 4) / 2;
            _loc4.mc._x = (__arrow_width - _loc4.mc._width) / 2 + __border_width;
        } // end if
        if (__icon_id != undefined)
        {
            __icon_mc._y = (__height - __icon_mc._height) / 2 + 1;
        } // end if
        super.__init();
    } // End of the function
    function __changeButton(status)
    {
        __label.__set__underline(this["__text_underline" + status]);
        __label.__set__color(this["__text_color" + status]);
        super.__changeButton(status);
    } // End of the function
    function attachIcon(id, color)
    {
        __icon_color = color;
        __icon_id = id;
    } // End of the function
    function set iconColor(color)
    {
        var _loc2 = new Color(__icon_mc);
        _loc2.setRGB(color);
        //return (this.iconColor());
        null;
    } // End of the function
    function changeIcon(frame)
    {
        __icon_mc.gotoAndStop(frame);
    } // End of the function
    function arrow(type, color)
    {
        __arrow = type;
        __arrow_color = color;
    } // End of the function
    function set hPadding(param)
    {
        __h_padding = param;
        //return (this.hPadding());
        null;
    } // End of the function
    function set vPadding(param)
    {
        __v_padding = param;
        //return (this.vPadding());
        null;
    } // End of the function
    function set txt(param)
    {
        __text = param;
        __label.__set__htmlTxt(__text);
        //return (this.txt());
        null;
    } // End of the function
    function set wrap(param)
    {
        __wrap = param;
        //return (this.wrap());
        null;
    } // End of the function
    function set bold(param)
    {
        __text_bold = param;
        //return (this.bold());
        null;
    } // End of the function
    function set textSize(param)
    {
        __text_size = param;
        //return (this.textSize());
        null;
    } // End of the function
    function set textAlign(param)
    {
        __text_align = param;
        //return (this.textAlign());
        null;
    } // End of the function
    function set font(param)
    {
        __text_font = param;
        //return (this.font());
        null;
    } // End of the function
    function set textUnderline(param)
    {
        __text_underline = param;
        //return (this.textUnderline());
        null;
    } // End of the function
    function set textColor(param)
    {
        __text_color = param;
        //return (this.textColor());
        null;
    } // End of the function
    function set textUnderlineHover(param)
    {
        __text_underline_hover = param;
        //return (this.textUnderlineHover());
        null;
    } // End of the function
    function set textColorHover(param)
    {
        __text_color_hover = param;
        //return (this.textColorHover());
        null;
    } // End of the function
    function set textUnderlineActive(param)
    {
        __text_underline_active = param;
        //return (this.textUnderlineActive());
        null;
    } // End of the function
    function set textColorActive(param)
    {
        __text_color_active = param;
        //return (this.textColorActive());
        null;
    } // End of the function
    function set textUnderlinePushed(param)
    {
        __text_underline_pushed = param;
        //return (this.textUnderlinePushed());
        null;
    } // End of the function
    function set textColorPushed(param)
    {
        __text_color_pushed = param;
        //return (this.textColorPushed());
        null;
    } // End of the function
    function set textUnderlinePushedHover(param)
    {
        __text_underline_pushed_hover = param;
        //return (this.textUnderlinePushedHover());
        null;
    } // End of the function
    function set textColorPushedHover(param)
    {
        __text_color_pushed_hover = param;
        //return (this.textColorPushedHover());
        null;
    } // End of the function
    function get label()
    {
        return (__label);
    } // End of the function
    function get arrowWidth()
    {
        return (__arrow_width);
    } // End of the function
    function shrink()
    {
        __height = undefined;
        __width = __label.__get__x() + __label.__get__textWidth() + 5 + (__h_padding + __border_width) * 2;
        this.__init();
    } // End of the function
    var __h_padding = 10;
    var __v_padding = 4;
    var __wrap = false;
    var __text_align = "center";
    var __text_underline = false;
    var __text_color = 0;
    var __text_underline_hover = false;
    var __text_color_hover = 10027008;
    var __text_underline_active = false;
    var __text_color_active = 16711680;
    var __text_underline_pushed = false;
    var __text_color_pushed = 10027008;
    var __text_underline_pushed_hover = false;
    var __text_color_pushed_hover = 10027008;
    var __icon_spacing = 5;
    var __text_depth = 15;
    var __icon_depth = 40;
    var __arrow_depth = 50;
    var __mask_depth = 60;
} // End of Class
