class com.ammap.FadeColor
{
    var __target_mc, __diff, __current, __color, __final, __total_count, __count, __interval;
    function FadeColor(target_mc)
    {
        __target_mc = target_mc;
    } // End of the function
    function fadeTo(color, time, percent)
    {
        __diff = new Object();
        if (percent == undefined)
        {
            percent = 100;
        } // end if
        percent = percent / 100;
        var _loc4 = new flash.geom.Transform(__target_mc);
        __current = _loc4.colorTransform;
        __color = new Color(__target_mc);
        __color.setRGB(color);
        _loc4 = new flash.geom.Transform(__target_mc);
        var _loc3 = _loc4.colorTransform;
        __final = _loc3;
        __diff.ro = (_loc3.redOffset - __current.redOffset) * percent;
        __diff.go = (_loc3.greenOffset - __current.greenOffset) * percent;
        __diff.bo = (_loc3.blueOffset - __current.blueOffset) * percent;
        _loc4.colorTransform = __current;
        __total_count = time * 1000 / 20;
        __count = 0;
        if (__total_count > 0)
        {
            __interval = setInterval(this, "__changeColor", 20);
        }
        else
        {
            _loc4 = new flash.geom.Transform(__target_mc);
            var _loc5 = _loc4.colorTransform;
            _loc4.colorTransform = _loc3;
        } // end else if
    } // End of the function
    function __changeColor()
    {
        if (__count < __total_count)
        {
            __current.redOffset = __current.redOffset + __diff.ro / __total_count;
            __current.greenOffset = __current.greenOffset + __diff.go / __total_count;
            __current.blueOffset = __current.blueOffset + __diff.bo / __total_count;
            var _loc2 = new flash.geom.Transform(__target_mc);
            var _loc3 = _loc2.colorTransform;
            _loc2.colorTransform = __current;
            ++__count;
        }
        else
        {
            _loc2 = new flash.geom.Transform(__target_mc);
            _loc3 = _loc2.colorTransform;
            _loc2.colorTransform = __final;
            clearInterval(__interval);
        } // end else if
    } // End of the function
    function stop()
    {
        clearInterval(__interval);
    } // End of the function
} // End of Class
