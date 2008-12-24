class com.ammap.Balloon
{
    var __mc, __text, __l, __r, __t, __b, __text_width, __text_field, __text_color, __text_size, __font, __text_height, __y, __by, __bx, __x, __bg_mc, __get__pointerPosition, __get__distance, __get__pointerWidth, __get__boxX, __get__boxY, __get__textColor, __get__textSize, __get__font, __get__bgColor, __get__bgAlpha, __get__borderWidth, __get__borderColor, __get__borderAlpha, __get__vMargins, __get__hMargins, __get__bMargins, __get__showBubble, __get__cornerRadius, __set__bMargins, __set__bgAlpha, __set__bgColor, __get__bg_mc, __set__borderAlpha, __set__borderColor, __set__borderWidth, __set__boxX, __set__boxY, __set__cornerRadius, __set__distance, __set__font, __set__hMargins, __get__mc, __set__pointerPosition, __set__pointerWidth, __set__showBubble, __set__textColor, __set__textSize, __set__vMargins, __get__yBot, __get__yTop;
    function Balloon(target_mc, name, depth, text, l, t, r, b, max_width)
    {
        __mc = target_mc.createEmptyMovieClip(name, depth);
        __text = text;
        if (__text.substr(-4) == "<br>")
        {
            __text = text.slice(0, -4);
        } // end if
        __l = l;
        __r = r;
        __t = t;
        __b = b;
        __max_width = max_width || __max_width;
    } // End of the function
    function __init()
    {
        __text_width = __max_width - __h_margins * 2 - __distance;
        __text_field = new com.ammap.Text(__mc, "textField", 10, 0, 0, __text_width, 0, "left");
        __text_field.__set__color(__text_color);
        __text_field.__set__size(__text_size);
        __text_field.__set__font(__font);
        __text_field.__set__htmlTxt(__text);
        if (__text_field.__get__textWidth() < __text_width)
        {
            __text_field.__set__width(__text_field.__get__textWidth() + 5);
        } // end if
        __text_width = __text_field.width;
        __text_height = __text_field.height;
        this.__build();
    } // End of the function
    function __build()
    {
        var _loc7 = new Array();
        var _loc6 = new Array();
        if (__pointer_pos == "horizontal")
        {
            if (__corner_radius == 0)
            {
                __text_field.__set__y(__y - __text_height / 2);
            }
            else
            {
                __text_field.__set__y(__y + __corner_radius + __border_width);
            } // end else if
            if (__by != undefined)
            {
                __text_field.__set__y(__by + __v_margins);
            } // end if
            if (__bx != undefined)
            {
                __text_field.__set__x(__bx + __h_margins);
            } // end if
            if (__text_field.__get__y() < __t + __b_margins + __v_margins)
            {
                __text_field.__set__y(__t + __b_margins + __v_margins);
            } // end if
            if (__text_field.__get__y() + __text_height > __b - __b_margins - __v_margins)
            {
                __text_field.__set__y(__b - __b_margins - __text_height - __v_margins);
            } // end if
            var _loc3 = __y - __pointer_width / 2;
            if (_loc3 < __text_field.__get__y() - __v_margins)
            {
                _loc3 = __text_field.__get__y() - __v_margins;
            } // end if
            if (_loc3 > __text_field.__get__y() + __v_margins + __text_height - __pointer_width)
            {
                _loc3 = __text_field.__get__y() + __v_margins + __text_height - __pointer_width;
            } // end if
            var _loc2 = __y + __pointer_width / 2;
            if (_loc2 > __text_field.__get__y() + __v_margins + __text_height)
            {
                _loc2 = __text_field.__get__y() + __v_margins + __text_height;
            } // end if
            if (_loc2 < __text_field.__get__y() - __v_margins + __pointer_width)
            {
                _loc2 = __text_field.__get__y() - __v_margins + __pointer_width;
            } // end if
            if (__x >= (__r - __l) / 2 + __l)
            {
                if (__bx == undefined)
                {
                    __text_field.__set__x(__x - (__text_width + __h_margins + __distance + __corner_radius / 2));
                } // end if
                _loc7 = [__text_field.__get__x() - __h_margins, __text_field.__get__x() + __h_margins + __text_width, __text_field.__get__x() + __h_margins + __text_width, __x, __text_field.__get__x() + __h_margins + __text_width, __text_field.__get__x() + __h_margins + __text_width, __text_field.__get__x() - __h_margins];
                _loc6 = [__text_field.__get__y() - __v_margins, __text_field.__get__y() - __v_margins, _loc3, __y, _loc2, __text_field.__get__y() + __v_margins + __text_height, __text_field.__get__y() + __v_margins + __text_height, __text_field.__get__y() - __v_margins];
            }
            else
            {
                if (__bx == undefined)
                {
                    __text_field.__set__x(__x + __h_margins + __distance + __corner_radius);
                } // end if
                _loc7 = [__text_field.__get__x() - __h_margins, __text_field.__get__x() + __text_width + __h_margins, __text_field.__get__x() + __text_width + __h_margins, __text_field.__get__x() - __h_margins, __text_field.__get__x() - __h_margins, __x, __text_field.__get__x() - __h_margins, __text_field.__get__x() - __h_margins];
                _loc6 = [__text_field.__get__y() - __v_margins, __text_field.__get__y() - __v_margins, __text_field.__get__y() + __text_height + __v_margins, __text_field.__get__y() + __text_height + __v_margins, _loc2, __y, _loc3, __text_field.__get__y() - __v_margins];
            } // end if
        } // end else if
        if (__pointer_pos == "vertical")
        {
            __text_field.__set__x(__x - __text_width / 2);
            if (__by != undefined)
            {
                __text_field.__set__y(__by + __v_margins);
            } // end if
            if (__bx != undefined)
            {
                __text_field.__set__x(__bx + __h_margins);
            } // end if
            if (__text_field.__get__x() < __l + __b_margins + __h_margins)
            {
                __text_field.__set__x(__l + __b_margins + __h_margins);
            } // end if
            if (__text_field.__get__x() + __text_width > __r - __b_margins - __h_margins)
            {
                __text_field.__set__x(__r - __b_margins - __text_width - __h_margins);
            } // end if
            var _loc5 = __x - __pointer_width / 2;
            if (_loc5 < __text_field.__get__x() - __h_margins)
            {
                _loc5 = __text_field.__get__x() - __h_margins;
            } // end if
            if (_loc5 > __text_field.__get__x() + __h_margins + __text_width - __pointer_width)
            {
                _loc5 = __text_field.__get__x() + __h_margins + __text_width - __pointer_width;
            } // end if
            var _loc4 = __x + __pointer_width / 2;
            if (_loc4 > __text_field.__get__x() + __h_margins + __text_width)
            {
                _loc4 = __text_field.__get__x() + __h_margins + __text_width;
            } // end if
            if (_loc4 < __text_field.__get__x() - __h_margins + __pointer_width)
            {
                _loc4 = __text_field.__get__x() - __h_margins + __pointer_width;
            } // end if
            if (__y >= (__b - __t) / 2 + __t)
            {
                if (__by == undefined)
                {
                    __text_field.__set__y(__y - (__text_height + __v_margins + __distance));
                } // end if
                _loc7 = [__text_field.__get__x() - __h_margins, __text_field.__get__x() + __text_width + __h_margins, __text_field.__get__x() + __text_width + __h_margins, _loc4, __x, _loc5, __text_field.__get__x() - __h_margins, __text_field.__get__x() - __h_margins];
                _loc6 = [__text_field.__get__y() - __v_margins, __text_field.__get__y() - __v_margins, __text_field.__get__y() + __v_margins + __text_height, __text_field.__get__y() + __v_margins + __text_height, __y, __text_field.__get__y() + __v_margins + __text_height, __text_field.__get__y() + __v_margins + __text_height, __text_field.__get__y() - __v_margins];
            }
            else
            {
                if (__by == undefined)
                {
                    __text_field.__set__y(__y + __v_margins + __distance);
                } // end if
                _loc7 = [__text_field.__get__x() - __h_margins, _loc5, __x, _loc4, __text_field.__get__x() + __text_width + __h_margins, __text_field.__get__x() + __text_width + __h_margins, __text_field.__get__x() - __h_margins, __text_field.__get__x() - __h_margins];
                _loc6 = [__text_field.__get__y() - __v_margins, __text_field.__get__y() - __v_margins, __y, __text_field.__get__y() - __v_margins, __text_field.__get__y() - __v_margins, __text_field.__get__y() + __v_margins + __text_height, __text_field.__get__y() + __v_margins + __text_height, __text_field.__get__y() - __v_margins];
            } // end if
        } // end else if
        if (__corner_radius == 0)
        {
            var _loc9 = new com.ammap.Shape(__mc, "bg_mc", 0, _loc7, _loc6, __bg_color, __border_width, __border_color, __bg_alpha, __border_alpha);
        }
        else
        {
            _loc9 = new com.ammap.Rectangle(__mc, "bg_mc", 0, __text_field.__get__width() + __h_margins * 2 + __corner_radius, __text_field.__get__height() + (__v_margins + __corner_radius) * 2, __bg_color, __border_width, __border_color, __corner_radius, __bg_alpha, __border_alpha);
            _loc9.mc._x = __text_field.__get__x() - __h_margins - __corner_radius / 2;
            _loc9.mc._y = __text_field.__get__y() - __v_margins - __corner_radius - 5.000000E-001;
        } // end else if
        __bg_mc = _loc9.mc;
        if (__show_bubble == true)
        {
            var _loc8 = __mc.attachMovie("bullet_round", "bullet_round", 90);
            _loc8._x = __x;
            _loc8._y = __y;
            var _loc10 = new Color(_loc8);
            _loc10.setRGB(__bg_color);
        } // end if
    } // End of the function
    function pointTo(x, y)
    {
        __x = x;
        __y = y - 5.000000E-001;
        this.__build();
    } // End of the function
    function show()
    {
        this.__init();
    } // End of the function
    function set pointerPosition(param)
    {
        __pointer_pos = param;
        //return (this.pointerPosition());
        null;
    } // End of the function
    function set distance(param)
    {
        __distance = param;
        //return (this.distance());
        null;
    } // End of the function
    function set pointerWidth(param)
    {
        __pointer_width = param;
        //return (this.pointerWidth());
        null;
    } // End of the function
    function set boxX(param)
    {
        __bx = param;
        //return (this.boxX());
        null;
    } // End of the function
    function set boxY(param)
    {
        __by = param;
        //return (this.boxY());
        null;
    } // End of the function
    function set textColor(param)
    {
        __text_color = param;
        //return (this.textColor());
        null;
    } // End of the function
    function set textSize(param)
    {
        __text_size = param;
        //return (this.textSize());
        null;
    } // End of the function
    function set font(param)
    {
        __font = param;
        //return (this.font());
        null;
    } // End of the function
    function set bgColor(param)
    {
        __bg_color = param;
        //return (this.bgColor());
        null;
    } // End of the function
    function set bgAlpha(param)
    {
        __bg_alpha = param;
        //return (this.bgAlpha());
        null;
    } // End of the function
    function set borderWidth(param)
    {
        __border_width = param;
        //return (this.borderWidth());
        null;
    } // End of the function
    function set borderColor(param)
    {
        __border_color = param;
        //return (this.borderColor());
        null;
    } // End of the function
    function set borderAlpha(param)
    {
        __border_alpha = param;
        //return (this.borderAlpha());
        null;
    } // End of the function
    function set vMargins(param)
    {
        __v_margins = param;
        //return (this.vMargins());
        null;
    } // End of the function
    function set hMargins(param)
    {
        __h_margins = param;
        //return (this.hMargins());
        null;
    } // End of the function
    function set bMargins(param)
    {
        __b_margins = param;
        //return (this.bMargins());
        null;
    } // End of the function
    function set showBubble(param)
    {
        __show_bubble = param;
        //return (this.showBubble());
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
    function hide()
    {
        if (__mc != undefined)
        {
            __mc._visible = false;
        } // end if
    } // End of the function
    function set cornerRadius(param)
    {
        __corner_radius = param;
        //return (this.cornerRadius());
        null;
    } // End of the function
    function get yTop()
    {
        //return (__text_field.y() - __v_margins);
    } // End of the function
    function get yBot()
    {
        //return (__text_field.y() + __v_margins + __text_height);
    } // End of the function
    var __pointer_pos = "vertical";
    var __max_width = 200;
    var __distance = 15;
    var __pointer_width = 26;
    var __bg_color = 16777215;
    var __bg_alpha = 100;
    var __border_width = 0;
    var __border_color = 16763904;
    var __border_alpha = 100;
    var __v_margins = 10;
    var __h_margins = 10;
    var __b_margins = 0;
    var __corner_radius = 0;
    var __show_bubble = false;
} // End of Class
