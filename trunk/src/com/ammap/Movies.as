class com.ammap.Movies
{
    var __target_mc, __scene_movies_mc, __map_movies_mc, __map_mc, __data, __movie_data, __config, __movies_to_resize, __config_original, __data_original, data_source, useHandCursor, fader;
    function Movies(target_mc, map_mc, name, depth, movie_data, config, data, config_original, data_original)
    {
        AsBroadcaster.initialize(this);
        this.die();
        __target_mc = target_mc;
        __scene_movies_mc = target_mc.createEmptyMovieClip(name, depth);
        __map_movies_mc = map_mc.createEmptyMovieClip("movies_mc", 1);
        __map_mc = map_mc;
        __data = data;
        __movie_data = movie_data;
        __config = config;
        __movies_to_resize = new Array();
        __config_original = config_original;
        __data_original = data_original;
        this.__init();
    } // End of the function
    function __init(upper_levels)
    {
        var main_obj = this;
        if (__movie_data.movies.movie.length > 0)
        {
            for (var _loc6 = 0; _loc6 < __movie_data.movies.movie.length; ++_loc6)
            {
                var _loc2 = __movie_data.movies.movie[_loc6];
                if (upper_levels == true && _loc2.remain == false)
                {
                    continue;
                } // end if
                if (isNaN(_loc2.long) == true && isNaN(_loc2.lat) == true)
                {
                    var _loc4 = __scene_movies_mc;
                    var _loc11 = com.ammap.Utils.getCoordinate(_loc2.x, __config.width);
                    var _loc10 = com.ammap.Utils.getCoordinate(_loc2.y, __config.height);
                }
                else
                {
                    _loc4 = __map_movies_mc;
                    _loc11 = com.ammap.Utils.longitudeToPixels(__config.projection, _loc2.long, __data.tl_long, __data.br_long, __config.map_width);
                    _loc10 = com.ammap.Utils.latitudeToPixels(__config.projection, _loc2.lat, __data.tl_lat, __data.br_lat, __config.map_height);
                } // end else if
                var _loc7 = _loc4.getNextHighestDepth();
                var _loc3 = _loc4.createEmptyMovieClip("movie_mc" + _loc7, _loc7);
                _loc2.mc = _loc3;
                var _loc5 = _loc3.createEmptyMovieClip("container_mc", 0);
                _loc3._x = _loc11;
                _loc3._y = _loc10;
                _loc3.data_source = _loc2;
                if (_loc4._parent == __map_mc && _loc2.fixed_size == true)
                {
                    __movies_to_resize.push(_loc3);
                    _loc3._visible = false;
                } // end if
                if (_loc2.color != undefined)
                {
                    var _loc8 = new Color(_loc3);
                    _loc8.setRGB(_loc2.color);
                } // end if
                _loc3._alpha = _loc2.alpha;
                if (com.ammap.Utils.checkIfClickable(_loc2) == false && _loc2.balloon == false)
                {
                }
                else
                {
                    _loc3.onRollOver = function ()
                    {
                        if (main_obj.__config.movie.disable_when_clicked == true && main_obj.__config.selected_data_source == data_source)
                        {
                            useHandCursor = false;
                        }
                        else
                        {
                            main_obj.broadcastMessage("onRollOver", data_source);
                        } // end else if
                    };
                    _loc3.onRollOut = _loc3.onReleaseOutside = function ()
                    {
                        main_obj.broadcastMessage("onRollOut", data_source);
                        if (main_obj.__config.selected_data_source == data_source)
                        {
                        }
                        else if (data_source.color != undefined)
                        {
                            fader = new com.ammap.FadeColor(this);
                            fader.fadeTo(data_source.color, main_obj.__config.color_change_time_hover);
                        } // end else if
                    };
                    if (com.ammap.Utils.checkIfClickable(_loc2) == true)
                    {
                        _loc3.onRelease = function ()
                        {
                            main_obj.broadcastMessage("onGetURL", data_source);
                        };
                    } // end if
                } // end else if
                if (this.__checkIfEmbeded(_loc2.file) == true)
                {
                    var _loc9 = _loc5.attachMovie(_loc2.file, "movie_mc", 0);
                    this.__passMovieData(_loc9, [_loc2]);
                }
                else if (_loc2.file != undefined)
                {
                    var _loc12 = new com.ammap.Load();
                    _loc12.loadClip(__config.path + _loc2.file, _loc5, this, "__passMovieData", false, undefined, [_loc2]);
                } // end else if
                if (_loc2.rotation != undefined)
                {
                    _loc5._rotation = _loc2.rotation;
                } // end if
                if (__config.selected_data_source == _loc2 && _loc2.color_selected != undefined)
                {
                    _loc8 = new Color(_loc3);
                    _loc8.setRGB(_loc2.color_selected);
                } // end if
            } // end of for
        } // end if
        if (__movie_data.parent != __movie_data)
        {
            __movie_data = __movie_data.parent;
            this.__init(true);
        } // end if
    } // End of the function
    function __checkIfEmbeded(name)
    {
        for (var _loc2 = 0; _loc2 < __embeded_movies.length; ++_loc2)
        {
            if (name == __embeded_movies[_loc2])
            {
                return (true);
            } // end if
        } // end of for
    } // End of the function
    function __passMovieData(movie_mc, params)
    {
        var _loc6 = params[0];
        if (_loc6.width != undefined)
        {
            movie_mc._width = com.ammap.Utils.getCoordinate(_loc6.width, __config.width);
        } // end if
        if (_loc6.height != undefined)
        {
            movie_mc._height = com.ammap.Utils.getCoordinate(_loc6.height, __config.height);
        } // end if
        if (_loc6.center == true)
        {
            movie_mc._x = movie_mc._x - movie_mc._width / 2;
            movie_mc._y = movie_mc._y - movie_mc._height / 2;
        } // end if
        var _loc5 = _loc6.flash_vars.split("&");
        for (var _loc2 = 0; _loc2 < _loc5.length; ++_loc2)
        {
            var _loc3 = _loc5[_loc2].split("=");
            movie_mc[_loc3[0]] = _loc3[1];
        } // end of for
        movie_mc.config = __config;
        movie_mc.data = __data;
        movie_mc.config_original = __config_original;
        movie_mc.data_original = __data_original;
        __target_mc.all_movies.push(movie_mc);
    } // End of the function
    function moviesToResize()
    {
        return (__movies_to_resize);
    } // End of the function
    function die()
    {
        for (var _loc2 = 0; _loc2 < __target_mc.all_movies.length; ++_loc2)
        {
            __target_mc.all_movies[_loc2].die();
        } // end of for
    } // End of the function
    var __embeded_movies = ["rectangle", "circle", "border", "target", "home"];
} // End of Class
