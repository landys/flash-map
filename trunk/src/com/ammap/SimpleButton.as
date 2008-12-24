class com.ammap.SimpleButton
{
    var __mc, __width, __height, __hit_area_width, __hit_area_height, __hit_area_mc, __border_mc, __get__pushable, __get__unpushable, __get__pushed, __get__hover, __index, __get__index, __get__cornerRadius, __get__borderAlpha, __get__borderWidth, __get__bgColor, __get__bgAlpha, __get__borderColor, __get__bgColorHover, __get__bgAlphaHover, __get__borderColorHover, __get__bgColorActive, __get__bgAlphaActive, __get__borderColorActive, __get__bgColorPushed, __get__bgAlphaPushed, __get__borderColorPushed, __get__bgColorPushedHover, __get__bgAlphaPushedHover, __get__borderColorPushedHover, __get__hitAreaWidth, __get__hitAreaHeight, __set__bgAlpha, __set__bgAlphaActive, __set__bgAlphaHover, __set__bgAlphaPushed, __set__bgAlphaPushedHover, __set__bgColor, __set__bgColorActive, __set__bgColorHover, __set__bgColorPushed, __set__bgColorPushedHover, __set__borderAlpha, __set__borderColor, __set__borderColorActive, __set__borderColorHover, __set__borderColorPushed, __set__borderColorPushedHover, __set__borderWidth, __set__cornerRadius, __get__height, __set__hitAreaHeight, __set__hitAreaWidth, __set__hover, __set__index, __get__mc, __set__pushable, __set__pushed, __set__unpushable, __get__width;
    function SimpleButton(target_mc, name, depth, width, height)
    {
        __mc = target_mc.createEmptyMovieClip(name, depth);
        __width = width;
        __height = height;
    } // End of the function
    function __init()
    {
        AsBroadcaster.initialize(this);
        var main_obj = this;
        if (__hit_area_width == undefined)
        {
            __hit_area_width = __width;
        } // end if
        if (__hit_area_height == undefined)
        {
            __hit_area_height = __height;
        } // end if
        var _loc2 = new com.ammap.Rectangle(__mc, "hit_area_mc", __hit_area_depth, __hit_area_width, __hit_area_height, __bg_color, __border_width, __bg_color, __corner_radius);
        __hit_area_mc = _loc2.mc;
        __hit_area_mc._alpha = 0;
        var _loc4 = new com.ammap.Rectangle(__mc, "bg_mc", __bg_depth, __width, __height, __bg_color, __border_width, __bg_color, __corner_radius, __bg_alpha, 0);
        var _loc3 = new com.ammap.Rectangle(__mc, "border_mc", __border_depth, __width, __height, null, __border_width, __border_color, __corner_radius);
        __border_mc = _loc3.mc;
        __border_mc._alpha = __border_alpha;
        __hit_area_mc.onRollOver = function ()
        {
            main_obj.broadcastMessage("onRollOver", main_obj.__index);
            if (main_obj.__pushed != true)
            {
                main_obj.__changeButton("_hover");
            }
            else
            {
                main_obj.__changeButton("_pushed_hover");
            } // end else if
        };
        __hit_area_mc.onPress = function ()
        {
            main_obj.broadcastMessage("onPress", main_obj.__index);
            main_obj.__changeButton("_active");
        };
        __hit_area_mc.onRelease = function ()
        {
            main_obj.broadcastMessage("onRelease", main_obj.__index);
            if (main_obj.__pushable == true)
            {
                if (main_obj.__unpushable == true && main_obj.__pushed == true)
                {
                    main_obj.broadcastMessage("onUnpush", main_obj.__index);
                    main_obj.__pushed = false;
                    main_obj.__changeButton("_hover");
                }
                else
                {
                    main_obj.broadcastMessage("onPush", main_obj.__index);
                    main_obj.__pushed = true;
                    main_obj.__changeButton("_pushed_hover");
                } // end else if
            }
            else
            {
                main_obj.__changeButton("_hover");
            } // end else if
        };
        __hit_area_mc.onRollOut = __hit_area_mc.onReleaseOutside = function ()
        {
            main_obj.broadcastMessage("onRollOut", main_obj.__index);
            if (main_obj.__pushed == true)
            {
                main_obj.__changeButton("_pushed");
            }
            else
            {
                main_obj.__changeButton("");
            } // end else if
        };
        if (__pushed == true)
        {
            this.__changeButton("_pushed");
        } // end if
    } // End of the function
    function __changeButton(status)
    {
        var _loc4 = new com.ammap.Rectangle(__mc, "bg_mc", __bg_depth, __width, __height, this["__bg_color" + status], 0, 0, __corner_radius, this["__bg_alpha" + status], 0);
        var _loc2 = new Color(__border_mc);
        _loc2.setRGB(this["__border_color" + status]);
    } // End of the function
    function show()
    {
        this.__init();
    } // End of the function
    function set pushable(param)
    {
        __pushable = param;
        //return (this.pushable());
        null;
    } // End of the function
    function set unpushable(param)
    {
        __unpushable = param;
        //return (this.unpushable());
        null;
    } // End of the function
    function set pushed(param)
    {
        __pushed = param;
        if (param == true)
        {
            this.__changeButton("_pushed");
        }
        else
        {
            this.__changeButton("");
        } // end else if
        //return (this.pushed());
        null;
    } // End of the function
    function set hover(param)
    {
        if (param == true)
        {
            if (__pushed == true)
            {
                this.__changeButton("_pushed_hover");
            }
            else
            {
                this.__changeButton("_hover");
            } // end else if
        }
        else if (__pushed == true)
        {
            this.__changeButton("_pushed");
        }
        else
        {
            this.__changeButton("");
        } // end else if
        //return (this.hover());
        null;
    } // End of the function
    function set index(param)
    {
        __index = param;
        //return (this.index());
        null;
    } // End of the function
    function set cornerRadius(param)
    {
        __corner_radius = param;
        //return (this.cornerRadius());
        null;
    } // End of the function
    function set borderAlpha(param)
    {
        __border_alpha = param;
        //return (this.borderAlpha());
        null;
    } // End of the function
    function set borderWidth(param)
    {
        __border_width = param;
        //return (this.borderWidth());
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
    function set borderColor(param)
    {
        __border_color = param;
        //return (this.borderColor());
        null;
    } // End of the function
    function set bgColorHover(param)
    {
        __bg_color_hover = param;
        //return (this.bgColorHover());
        null;
    } // End of the function
    function set bgAlphaHover(param)
    {
        __bg_alpha_hover = param;
        //return (this.bgAlphaHover());
        null;
    } // End of the function
    function set borderColorHover(param)
    {
        __border_color_hover = param;
        //return (this.borderColorHover());
        null;
    } // End of the function
    function set bgColorActive(param)
    {
        __bg_color_active = param;
        //return (this.bgColorActive());
        null;
    } // End of the function
    function set bgAlphaActive(param)
    {
        __bg_alpha_active = param;
        //return (this.bgAlphaActive());
        null;
    } // End of the function
    function set borderColorActive(param)
    {
        __border_color_active = param;
        //return (this.borderColorActive());
        null;
    } // End of the function
    function set bgColorPushed(param)
    {
        __bg_color_pushed = param;
        //return (this.bgColorPushed());
        null;
    } // End of the function
    function set bgAlphaPushed(param)
    {
        __bg_alpha_pushed = param;
        //return (this.bgAlphaPushed());
        null;
    } // End of the function
    function set borderColorPushed(param)
    {
        __border_color_pushed = param;
        //return (this.borderColorPushed());
        null;
    } // End of the function
    function set bgColorPushedHover(param)
    {
        __bg_color_pushed_hover = param;
        //return (this.bgColorPushedHover());
        null;
    } // End of the function
    function set bgAlphaPushedHover(param)
    {
        __bg_alpha_pushed_hover = param;
        //return (this.bgAlphaPushedHover());
        null;
    } // End of the function
    function set borderColorPushedHover(param)
    {
        __border_color_pushed_hover = param;
        //return (this.borderColorPushedHover());
        null;
    } // End of the function
    function set hitAreaWidth(param)
    {
        __hit_area_width = param;
        __hit_area_mc._width = param;
        //return (this.hitAreaWidth());
        null;
    } // End of the function
    function set hitAreaHeight(param)
    {
        __hit_area_height = param;
        __hit_area_mc._height = param;
        //return (this.hitAreaHeight());
        null;
    } // End of the function
    function get mc()
    {
        return (__mc);
    } // End of the function
    function get width()
    {
        return (__width);
    } // End of the function
    function get height()
    {
        return (__height);
    } // End of the function
    var __corner_radius = 8;
    var __pushable = false;
    var __unpushable = false;
    var __pushed = false;
    var __border_alpha = 100;
    var __border_width = 4;
    var __bg_color = 16777215;
    var __bg_alpha = 100;
    var __border_color = 7829367;
    var __bg_color_hover = 16777215;
    var __bg_alpha_hover = 100;
    var __border_color_hover = 16750848;
    var __bg_color_active = 16777215;
    var __bg_alpha_active = 100;
    var __border_color_active = 16737792;
    var __bg_color_pushed = 16750848;
    var __bg_alpha_pushed = 100;
    var __border_color_pushed = 16750848;
    var __bg_color_pushed_hover = 16750848;
    var __bg_alpha_pushed_hover = 100;
    var __border_color_pushed_hover = 16737792;
    var __hit_area_depth = 0;
    var __bg_depth = 10;
    var __border_depth = 110;
} // End of Class
