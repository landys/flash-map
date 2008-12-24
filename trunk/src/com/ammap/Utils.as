class com.ammap.Utils
{
    function Utils()
    {
    } // End of the function
    static function parseTrue(value, if_undefined)
    {
        var _loc1 = false;
        if (value == true)
        {
            _loc1 = true;
        } // end if
        if (com.ammap.Utils.stripSymbols(value.toLowerCase(), " ") == "true")
        {
            _loc1 = true;
        } // end if
        if (com.ammap.Utils.stripSymbols(value.toLowerCase(), " ") == "yes")
        {
            _loc1 = true;
        } // end if
        if (value > 0)
        {
            _loc1 = true;
        } // end if
        if (value == "" || value == undefined)
        {
            _loc1 = if_undefined;
        } // end if
        return (_loc1);
    } // End of the function
    static function toNumber(value, if_nan)
    {
        var _loc1 = Number(value);
        if (isNaN(_loc1) == true)
        {
            _loc1 = if_nan;
        } // end if
        return (_loc1);
    } // End of the function
    static function toColor(value, if_undefined)
    {
        var _loc1 = Number("0x" + value.substr(-6));
        if (isNaN(_loc1) == true)
        {
            _loc1 = if_undefined;
        } // end if
        return (_loc1);
    } // End of the function
    static function checkUndefined(value, if_undefined)
    {
        if (value == undefined)
        {
            return (if_undefined);
        } // end if
        return (value);
    } // End of the function
    static function changeBoolean(value)
    {
        if (value == true)
        {
            return (false);
        } // end if
        if (value == false)
        {
            return (true);
        } // end if
    } // End of the function
    static function replace(string, find, replace)
    {
        return (string.split(find).join(replace));
    } // End of the function
    static function stripSymbols(string, symbol)
    {
        var _loc1 = string.split(symbol);
        return (_loc1.join(""));
    } // End of the function
    static function formatNumber(num, decimals_separator, thousands_separator)
    {
        if (decimals_separator == undefined)
        {
            decimals_separator = ",";
        } // end if
        if (thousands_separator == undefined)
        {
            thousands_separator = " ";
        } // end if
        if (num < 0)
        {
            var _loc7 = "-";
        }
        else
        {
            _loc7 = "";
        } // end else if
        num = Math.abs(num);
        var _loc9 = num.toString();
        var _loc5 = _loc9.split(".");
        var _loc2 = "";
        var _loc3 = _loc5[0].toString();
        for (var _loc1 = _loc3.length; _loc1 >= 0; _loc1 = _loc1 - 3)
        {
            if (_loc1 != _loc3.length)
            {
                if (_loc1 != 0)
                {
                    _loc2 = _loc3.substring(_loc1 - 3, _loc1) + thousands_separator + _loc2;
                }
                else
                {
                    _loc2 = _loc3.substring(_loc1 - 3, _loc1) + _loc2;
                } // end else if
                continue;
            } // end if
            _loc2 = _loc3.substring(_loc1 - 3, _loc1);
        } // end of for
        if (_loc5[1] != undefined)
        {
            _loc2 = _loc2 + decimals_separator + _loc5[1];
        } // end if
        _loc2 = _loc7 + _loc2;
        return (_loc2);
    } // End of the function
    static function tweekAddress(address, path)
    {
        if (address.substr(0, 7) != "http://" || address.substr(0, 8) != "https://")
        {
            address = path + address;
        } // end if
        return (address);
    } // End of the function
    static function isArray(obj)
    {
        if (typeof(obj) == "object")
        {
            if (isNaN(obj.length) == true)
            {
                return (false);
            }
            else
            {
                return (true);
            } // end else if
        }
        else
        {
            return (false);
        } // end else if
    } // End of the function
    static function objectToArray(obj)
    {
        if (typeof(obj) == "object" && com.ammap.Utils.isArray(obj) == false)
        {
            var _loc2 = obj;
            obj = new Array();
            obj.push(_loc2);
        } // end if
        return (obj);
    } // End of the function
    static function fitToBounds(number, min, max)
    {
        if (number < min)
        {
            number = min;
        } // end if
        if (number > max)
        {
            number = max;
        } // end if
        return (number);
    } // End of the function
    static function roundTo(number, precision)
    {
        return (Math.round(number * Math.pow(10, precision)) / Math.pow(10, precision));
    } // End of the function
    static function getRef(obj, string)
    {
        if (string.indexOf(".") != -1)
        {
            var _loc1 = substring(string, 0, string.indexOf("."));
            var _loc3 = substring(string, string.indexOf(".") + 2, string.length);
        }
        else
        {
            _loc1 = string;
            _loc3 = undefined;
        } // end else if
        if (_loc1.indexOf("[") != -1 && _loc1.indexOf("]") != -1)
        {
            var _loc5 = _loc1.substring(0, _loc1.indexOf("["));
            var _loc6 = _loc1.substring(_loc1.indexOf("[") + 1, _loc1.indexOf("]"));
            var _loc4 = obj[_loc5][_loc6];
        }
        else
        {
            _loc4 = obj[_loc1];
        } // end else if
        if (_loc3 != undefined)
        {
            return (com.ammap.Utils.getRef(_loc4, _loc3));
        } // end if
        return (_loc4);
    } // End of the function
    static function rotateText(text_field, bg_color, target_mc, name, depth)
    {
        text_field.autoSize = "left";
        text_field.multiline = false;
        text_field.wordWrap = false;
        text_field.textWidth = 2000;
        var _loc3 = new flash.display.BitmapData(text_field._width, text_field._height, true, bg_color);
        _loc3.draw(text_field);
        var _loc2 = target_mc.createEmptyMovieClip(name, depth);
        _loc2.attachBitmap(_loc3, 0);
        _loc2._rotation = -90;
        text_field._visible = false;
        _loc2._x = text_field._x;
        _loc2._y = text_field._y;
        return (_loc2);
    } // End of the function
    static function formatText(config, text, title, value, percents, description)
    {
        if (description != undefined)
        {
            text = com.ammap.Utils.replace(text, "{description}", description);
        } // end if
        if (title != undefined)
        {
            text = com.ammap.Utils.replace(text, "{title}", title);
        }
        else
        {
            text = com.ammap.Utils.replace(text, "{title}", "");
        } // end else if
        if (value != undefined && isNaN(value) != true)
        {
            text = com.ammap.Utils.replace(text, "{value}", com.ammap.Utils.formatNumber(value, config.decimals_separator, config.thousands_separator));
        }
        else
        {
            text = com.ammap.Utils.replace(text, "{value}", "");
        } // end else if
        text = com.ammap.Utils.replace(text, "{percents}", com.ammap.Utils.formatNumber(com.ammap.Utils.roundTo(percents, config.precision), config.decimals_separator, config.thousands_separator));
        return (text);
    } // End of the function
    static function longitudeToPixels(projection, longitude, left_longitude, right_longitude, width)
    {
        if (typeof(longitude) == "object")
        {
            var _loc4 = new Array();
            for (var _loc1 = 0; _loc1 < longitude.length; ++_loc1)
            {
                _loc4[_loc1] = (Number(longitude[_loc1]) - left_longitude) / (right_longitude - left_longitude) * width;
            } // end of for
            return (_loc4);
        }
        else
        {
            return ((Number(longitude) - left_longitude) / (right_longitude - left_longitude) * width);
        } // end else if
    } // End of the function
    static function latitudeToPixels(projection, latitude, top_latitude, bottom_latitude, height)
    {
        if (typeof(latitude) == "object")
        {
            var _loc4 = new Array();
            for (var _loc1 = 0; _loc1 < latitude.length; ++_loc1)
            {
                if (projection == "mercator")
                {
                    _loc4[_loc1] = (com.ammap.Utils.mercatorLatToY(latitude[_loc1]) - com.ammap.Utils.mercatorLatToY(top_latitude)) / (com.ammap.Utils.mercatorLatToY(bottom_latitude) - com.ammap.Utils.mercatorLatToY(top_latitude)) * height;
                    continue;
                } // end if
                _loc4[_loc1] = (Number(latitude[_loc1]) - top_latitude) / (bottom_latitude - top_latitude) * height;
            } // end of for
            return (_loc4);
        }
        else if (projection == "mercator")
        {
            return ((com.ammap.Utils.mercatorLatToY(latitude) - com.ammap.Utils.mercatorLatToY(top_latitude)) / (com.ammap.Utils.mercatorLatToY(bottom_latitude) - com.ammap.Utils.mercatorLatToY(top_latitude)) * height);
        }
        else
        {
            return ((Number(latitude) - top_latitude) / (bottom_latitude - top_latitude) * height);
        } // end else if
    } // End of the function
    static function mercatorLatToY(lat)
    {
        lat = Number(lat);
        if (lat > 8.950000E+001)
        {
            lat = 8.950000E+001;
        } // end if
        if (lat < -8.950000E+001)
        {
            lat = -8.950000E+001;
        } // end if
        var _loc2 = com.ammap.Utils.degreesToRadians(lat);
        var _loc4 = 5.000000E-001 * Math.log((1 + Math.sin(_loc2)) / (1 - Math.sin(_loc2)));
        var _loc3 = com.ammap.Utils.radiansToDegrees(_loc4 / 2);
        return (_loc3);
    } // End of the function
    static function pixelsToMercatorLatitude(projection, y, top_latitude, bottom_latitude, height)
    {
        var _loc3 = y * (com.ammap.Utils.mercatorLatToY(bottom_latitude) - com.ammap.Utils.mercatorLatToY(top_latitude)) / height + com.ammap.Utils.mercatorLatToY(top_latitude);
        var _loc2 = _loc3 * 2 * 3.141593E+000 / 180;
        var _loc1 = 2 * Math.atan(Math.exp(_loc2)) - 1.570796E+000;
        _loc1 = com.ammap.Utils.radiansToDegrees(_loc1);
        return (_loc1);
    } // End of the function
    static function degreesToRadians(degrees)
    {
        return (degrees / 180 * 3.141593E+000);
    } // End of the function
    static function radiansToDegrees(radians)
    {
        return (radians / 3.141593E+000 * 180);
    } // End of the function
    static function getCoordinate(value, full)
    {
        if (value.substr(0, 1) == "!")
        {
            value = full - Number(value.substr(1));
        } // end if
        if (value.substr(-1) == "%")
        {
            var _loc2 = full * Number(value.substr(0, value.length - 1)) / 100;
        }
        else
        {
            _loc2 = Number(value);
            if (isNaN(_loc2))
            {
                _loc2 = undefined;
            } // end if
        } // end else if
        return (_loc2);
    } // End of the function
    static function getCoordinateFromArray(array, full)
    {
        var _loc3 = new Array();
        for (var _loc1 = 0; _loc1 < array.length; ++_loc1)
        {
            _loc3[_loc1] = com.ammap.Utils.getCoordinate(array[_loc1], full);
        } // end of for
        return (_loc3);
    } // End of the function
    static function checkIfClickable(data_source)
    {
        if (data_source.url != undefined || data_source.description != undefined && data_source.description != "" && data_source.text_box != false || data_source.zoom != undefined)
        {
            return (true);
        } // end if
        if (data_source.movies.movie.length > 0 || data_source.labels.label.length > 0 || data_source.lines.line.length > 0)
        {
            return (true);
        } // end if
        return (false);
    } // End of the function
} // End of Class
