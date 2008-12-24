class com.ammap.Load
{
    var __loader, __preloader;
    function Load()
    {
    } // End of the function
    function loadVars(file_name, obj, funct, time_stamp, error_funct)
    {
        var main_obj = this;
        __loader = new LoadVars();
        __loader.onData = function (variable)
        {
            main_obj.__preloader.remove();
            if (variable == undefined)
            {
                obj[error_funct]("Error loading file: " + file_name);
            }
            else
            {
                obj[funct](variable);
            } // end else if
        };
        __loader.load(file_name + this.__timeStamp(time_stamp));
    } // End of the function
    function loadXML(file_name, obj, funct, time_stamp, error_funct)
    {
        var main_obj = this;
        __loader = new XML();
        __loader.ignoreWhite = true;
        __loader.onLoad = function (success)
        {
            main_obj.__preloader.remove();
            if (success == false)
            {
                obj[error_funct]("Error loading file: " + file_name);
            }
            else
            {
                obj[funct](main_obj.__loader);
            } // end else if
        };
        __loader.load(file_name + this.__timeStamp(time_stamp));
    } // End of the function
    function loadClip(file_name, target_mc, obj, funct, time_stamp, error_funct, param)
    {
        var main_obj = this;
        __loader = target_mc;
        var _loc3 = new MovieClipLoader();
        var _loc2 = new Object();
        _loc2.onLoadError = function (target_mc, errorCode, httpStatus)
        {
            main_obj.__preloader.remove();
            obj[error_funct]("Error loading file: " + file_name);
        };
        _loc2.onLoadInit = function ()
        {
            main_obj.__preloader.remove();
            obj[funct](target_mc, param);
        };
        _loc3.addListener(_loc2);
        _loc3.loadClip(file_name + this.__timeStamp(time_stamp), __loader);
    } // End of the function
    function preloader(target_mc, name, depth, x, y, width, height, color, bgColor, text)
    {
        __preloader = new com.ammap.Preloader(target_mc, name, depth, __loader, width, height, color, bgColor, text);
        __preloader.__get__mc()._x = x;
        __preloader.__get__mc()._y = y;
    } // End of the function
    function __timeStamp(param)
    {
        if (param == true && _url.substr(0, 4).toLowerCase() == "http")
        {
            return ("?" + getTimer() + "" + random(Number.MAX_VALUE) + "" + random(Number.MAX_VALUE));
        }
        else
        {
            return ("");
        } // end else if
    } // End of the function
} // End of Class
