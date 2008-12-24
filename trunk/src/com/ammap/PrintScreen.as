class com.ammap.PrintScreen
{
    var broadcastMessage, record, id;
    function PrintScreen()
    {
        AsBroadcaster.initialize(this);
    } // End of the function
    function print(mc, x, y, w, h)
    {
        this.broadcastMessage("onStart", mc);
        if (x == undefined)
        {
            x = 0;
        } // end if
        if (y == undefined)
        {
            y = 0;
        } // end if
        if (w == undefined)
        {
            w = mc._width;
        } // end if
        if (h == undefined)
        {
            h = mc._height;
        } // end if
        var _loc6 = new flash.display.BitmapData(w, h, false);
        record = new LoadVars();
        record.width = w;
        record.height = h;
        record.cols = 0;
        record.rows = 0;
        var _loc5 = new flash.geom.Matrix();
        _loc5.translate(-x, -y);
        _loc6.draw(mc, _loc5, new flash.geom.ColorTransform(), 1, new flash.geom.Rectangle(0, 0, w, h));
        id = setInterval(copysource, 1, this, mc, _loc6);
    } // End of the function
    function copysource(scope, movie, bit)
    {
        var _loc5;
        var _loc2;
        scope.record["r" + scope.record.rows] = new Array();
        for (var _loc3 = 0; _loc3 < bit.width; ++_loc3)
        {
            _loc5 = bit.getPixel(_loc3, scope.record.rows);
            _loc2 = _loc5.toString(16);
            if (_loc2 == prev_pixel)
            {
                ++count;
                scope.record["r" + scope.record.rows][scope.record["r" + scope.record.rows].length - 1] = _loc2 + ":" + count;
            }
            else
            {
                scope.record["r" + scope.record.rows].push(_loc2);
                var count = 1;
            } // end else if
            var prev_pixel = _loc2;
        } // end of for
        scope.broadcastMessage("onProgress", movie, scope.record.rows, bit.height);
        scope.record.rows = scope.record.rows + 1;
        if (scope.record.rows >= bit.height)
        {
            clearInterval(scope.id);
            scope.broadcastMessage("onComplete", movie, scope.record);
            bit.dispose();
        } // end if
    } // End of the function
} // End of Class
