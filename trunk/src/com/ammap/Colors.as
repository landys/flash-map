class com.ammap.Colors
{
    function Colors()
    {
    } // End of the function
    static function getIntermediateColor(start_color, end_color, percent)
    {
        if (isNaN(percent) == true)
        {
            percent = 0;
        } // end if
        var _loc4 = new Object();
        var _loc1 = new flash.geom.ColorTransform();
        _loc1.rgb = start_color;
        var _loc2 = new flash.geom.ColorTransform();
        _loc2.rgb = end_color;
        _loc1.redOffset = _loc1.redOffset + (_loc2.redOffset - _loc1.redOffset) * percent / 100;
        _loc1.greenOffset = _loc1.greenOffset + (_loc2.greenOffset - _loc1.greenOffset) * percent / 100;
        _loc1.blueOffset = _loc1.blueOffset + (_loc2.blueOffset - _loc1.blueOffset) * percent / 100;
        return (_loc1.rgb);
    } // End of the function
    static function setBrightness(target_mc, value)
    {
        var _loc5 = new Color(target_mc);
        var _loc4 = 100 - Math.abs(value);
        var _loc2 = 0;
        if (value > 0)
        {
            _loc2 = 256 * (value / 100);
        } // end if
        var _loc1 = new Object();
        _loc1.ra = _loc1.ga = _loc1.ba = _loc4;
        _loc1.rb = _loc1.gb = _loc1.bb = _loc2;
        _loc5.setTransform(_loc1);
    } // End of the function
} // End of Class
