class com.ammap.Text
{
    var __text, __format, __get__txt, __get__htmlTxt, __get__size, __get__bold, __get__underline, __get__color, __get__font, __get__x, __get__y, __get__textHeight, __get__wrap, __get__multiline, __get__align, __get__textWidth, __get__width, __get__selectable, __get__autoSize, __set__align, __set__autoSize, __set__bold, __set__color, __get__field, __set__font, __get__height, __set__htmlTxt, __set__multiline, __set__selectable, __set__size, __set__textHeight, __set__textWidth, __set__txt, __set__underline, __set__width, __set__wrap, __set__x, __set__y;
    function Text(target_mc, name, depth, x, y, width, height, autosize, config)
    {
        __font = config.font || _global.font || __font;
        __size = config.text_size || __size;
        __color = config.text_color || __color;
        target_mc.createTextField(name, depth, x, y, width, height);
        __text = target_mc[name];
        if ((height == undefined || width == undefined || height == 0 || width == 0) && autosize == undefined)
        {
            autosize = "left";
        } // end if
        if (width == 0 || width == undefined || isNaN(width) == true)
        {
            __wrap = false;
        } // end if
        __text.multiline = __multiline;
        __text.autoSize = autosize;
        __text.selectable = __selectable;
        __text.wordWrap = __wrap;
        __text.border = false;
        __text.embedFonts = __embed_fonts;
        __format = new TextFormat();
        __format.font = __font;
        __format.size = __size;
        __format.color = __color;
    } // End of the function
    function set txt(param)
    {
        __text.text = param;
        __text.setTextFormat(__format);
        //return (this.txt());
        null;
    } // End of the function
    function set htmlTxt(param)
    {
        __text.html = true;
        param = "<font color=\'#" + __color.toString(16) + "\' size=\'" + __size + "\' face=\'" + __font + "\'>" + param + "</font>";
        __text.htmlText = param;
        //return (this.htmlTxt());
        null;
    } // End of the function
    function set size(param)
    {
        __format.size = param || __size;
        __size = param || this.__get__size();
        __text.setTextFormat(__format);
        //return (this.size());
        null;
    } // End of the function
    function set bold(param)
    {
        __format.bold = param;
        __text.setTextFormat(__format);
        //return (this.bold());
        null;
    } // End of the function
    function set underline(param)
    {
        __format.underline = param;
        __text.setTextFormat(__format);
        //return (this.underline());
        null;
    } // End of the function
    function set color(param)
    {
        if (param != undefined && isNaN(param) == false)
        {
            __format.color = param;
            __color = param;
        }
        else
        {
            __format.color = __color;
        } // end else if
        __text.setTextFormat(__format);
        //return (this.color());
        null;
    } // End of the function
    function set font(param)
    {
        if (param != undefined)
        {
            __format.font = param;
            __font = param;
            __text.setTextFormat(__format);
        } // end if
        //return (this.font());
        null;
    } // End of the function
    function set x(param)
    {
        __text._x = param;
        //return (this.x());
        null;
    } // End of the function
    function set y(param)
    {
        __text._y = param;
        //return (this.y());
        null;
    } // End of the function
    function set textHeight(param)
    {
        __text.textHeight = param;
        //return (this.textHeight());
        null;
    } // End of the function
    function set wrap(param)
    {
        __text.wordWrap = param;
        //return (this.wrap());
        null;
    } // End of the function
    function set multiline(param)
    {
        __text.multiline = param;
        //return (this.multiline());
        null;
    } // End of the function
    function set align(param)
    {
        var _loc2 = new TextFormat();
        _loc2.align = param;
        __text.setTextFormat(_loc2);
        //return (this.align());
        null;
    } // End of the function
    function set textWidth(param)
    {
        __text.textWidth = param;
        //return (this.textWidth());
        null;
    } // End of the function
    function set width(param)
    {
        __text._width = param;
        //return (this.width());
        null;
    } // End of the function
    function set selectable(param)
    {
        __text.selectable = param;
        //return (this.selectable());
        null;
    } // End of the function
    function set autoSize(param)
    {
        __text.autoSize = param;
        //return (this.autoSize());
        null;
    } // End of the function
    function get x()
    {
        return (__text._x);
    } // End of the function
    function get y()
    {
        return (__text._y);
    } // End of the function
    function get textHeight()
    {
        return (__text.textHeight);
    } // End of the function
    function get width()
    {
        return (__text._width);
    } // End of the function
    function get height()
    {
        __text._height;
        return (__text._height);
    } // End of the function
    function get textWidth()
    {
        return (__text.textWidth);
    } // End of the function
    function get field()
    {
        return (__text);
    } // End of the function
    var __font = "Arial";
    var __size = 11;
    var __color = 0;
    var __align = "left";
    var __selectable = false;
    var __multiline = true;
    var __wrap = true;
    var __embed_fonts = false;
} // End of Class
