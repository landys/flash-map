import flx.external.FlashInterface;
class com.ammap.Ammap
{
    var __target_mc, __config_original, __data_original, __mc, __data, __config, __reloading_data, __map_mc, __map_container_mc, __developer_tf, __navigation_path, __labels, __movies, __movies_to_resize, __arrows_to_resize, __data_source, useHandCursor, __final_x, __final_y, __zoom_map_x, __zoom_map_y, __zoom_mc, __grid_step, __click_interval, __map_inited, __inited_interval, __moved, __map_move_start_x, __move_start_x, __map_move_start_y, __move_start_y, __final_scale, __tween, __initial_x, __initial_y, __initial_scale, __tween_percent, __interval, __zoom_tool_mc, bg_mc, __nav_mc, x_dir, y_dir, old_x, old_y, __object_list, __small_map_tool_mc, __small_map_mc, __small_map_width, __small_map_height, _xmouse, _ymouse, __small_map_mask_mc, __small_map_container_mc, __rectangle_mc, __mouse_listener, no_hover, data_source, __time_out, __text_box_mc, __balloon, __balloon_mc, __text_box, __xy, __xyp, __zoom_info, __long, __lat, __long_lat, __stage_listener, __resize_interval, __resize_time, __get__data, __set__data, __get__lat, __get__long, __get__mapInited, __get__mc, __get__stage_x, __get__stage_xp, __get__stage_y, __get__stage_yp, __get__zoom_level, __get__zoom_x, __get__zoom_y;
    function Ammap(target_mc, name, depth, config, data, config_original, data_original, reloading_data)
    {
        __target_mc = target_mc;
        __config_original = config_original;
        __data_original = data_original;
        __mc = target_mc.createEmptyMovieClip(name, depth);
        __mc.all_movies = new Array();
        __data = data;
        __config = config;
        __reloading_data = reloading_data;
        __data.title = __config.navigation_path.home_text;
        __data.top = true;
        this.__init();
    } // End of the function
    function __init()
    {
        _global.wheel_busy = false;
        var main_obj = this;
        __map_mc = __mc.createEmptyMovieClip("map_mc", __map_depth);
        __map_container_mc = __map_mc.createEmptyMovieClip("map_container_mc", 0);
        __map_mc._visible = false;
        var _loc5 = new com.ammap.Load();
        _loc5.loadClip(__config.path + __data.map_file, __map_container_mc, this, "__resizeMap", false, "__error");
        if (__reloading_data != true)
        {
            _loc5.preloader(__mc, "preloader_mc", __preloader_depth, 0, 0, __config.width, __config.height, __config.preloader_color, undefined, __config.strings.loading_map);
        } // end if
        this.__initMouseListener();
        if (__config.background.file != undefined)
        {
            var _loc3 = __target_mc.createEmptyMovieClip("bg_mc", 0);
            _loc5 = new com.ammap.Load();
            _loc5.loadClip(__config.path + __config.background.file, _loc3, this, "__passMovieData", _loc3);
        } // end if
        if (__config.developer_mode == true)
        {
            __developer_tf = new com.ammap.Text(__mc, "developer_tf", __developer_depth, 80, 80, __config.width - 70);
        } // end if
        if (__config.navigation_path.enabled == true)
        {
            __navigation_path = new com.ammap.NavigationPath(__mc, "navigation_path_mc", __navigation_path_depth, __config);
        } // end if
        var _loc4 = new Object();
        _loc4.onClick = function (data_source)
        {
            main_obj.__clickItem(data_source);
        };
        __navigation_path.addListener(_loc4);
        if (__config.redraw == true)
        {
            this.__stageListener();
        } // end if
        this.__initLegend();
    } // End of the function
    function __initObjects(data)
    {
        var main_obj = this;
        var _loc2 = new Object();
        _loc2.onGetURL = function (data_source)
        {
            main_obj.__clickItem(data_source);
        };
        _loc2.onRollOver = function (data_source)
        {
            main_obj.__hoverItem(data_source);
        };
        _loc2.onRollOut = function (data_source)
        {
            main_obj.__balloon_mc._visible = false;
            if (main_obj.__config.text_box.hide_on_roll_out == true)
            {
                main_obj.__hideTextBox();
            } // end if
            main_obj.__rollOutItem(data_source);
        };
        __labels = new com.ammap.Labels(__mc, __map_mc, "labels_mc", __labels_depth, data, __config, __data);
        __labels.addListener(_loc2);
        __movies.die();
        __movies = new com.ammap.Movies(__mc, __map_mc, "movies_mc", __movies_depth, data, __config, __data, __config_original, __data_original);
        __movies.addListener(_loc2);
        __movies_to_resize = __movies.moviesToResize();
        var _loc3 = new com.ammap.Lines(__mc, __map_mc, "lines_mc", __lines_depth, data, __config, __data);
        __arrows_to_resize = _loc3.arrowsToResize();
    } // End of the function
    function __resizeMap(map_mc, resize_only)
    {
        var main_obj = this;
        if (__data_source == undefined)
        {
            __data_source = __data;
        } // end if
        var _loc4 = new com.ammap.Rectangle(__mc, "bg_mc", __bg_depth, __config.width, __config.height, __config.background.color, 1, __config.background.border_color, 0, __config.background.alpha, __config.background.border_alpha);
        if (__config.zoom.background_zooms_to_top == true)
        {
            _loc4.mc.onRollOver = function ()
            {
                useHandCursor = false;
            };
            _loc4.mc.onRelease = function ()
            {
                main_obj.__getURL("#top");
            };
        } // end if
        if (__config.fit_to_screen == true)
        {
            if (map_mc._width / __config.width > map_mc._height / __config.height)
            {
                var _loc3 = __config.width / map_mc._width;
            }
            else
            {
                _loc3 = __config.height / map_mc._height;
            } // end else if
            map_mc._width = map_mc._width * _loc3;
            map_mc._height = map_mc._height * _loc3;
        } // end if
        var _loc8 = __map_mc._x / __config.map_width * 100 + "%";
        var _loc7 = __map_mc._y / __config.map_height * 100 + "%";
        var _loc6 = __final_x / __config.map_width * 100 + "%";
        var _loc5 = __final_y / __config.map_height * 100 + "%";
        __config.map_width = map_mc._width;
        __config.map_height = map_mc._height;
        this.__initAreas();
        this.__initZoom();
        if (resize_only != true)
        {
            if (__data.zoom == undefined)
            {
                __data.zoom = __config.zoom.min;
            } // end if
            if (__data_source.zoom_x == undefined)
            {
                __map_mc._x = (__config.width - __config.map_width) / 2;
            }
            else
            {
                __map_mc._x = com.ammap.Utils.getCoordinate(__data_source.zoom_x, __config.map_width);
            } // end else if
            if (__data_source.zoom_y == undefined)
            {
                __map_mc._y = (__config.height - __config.map_height) / 2;
            }
            else
            {
                __map_mc._y = com.ammap.Utils.getCoordinate(__data_source.zoom_y, __config.map_height);
            } // end else if
            __zoom_map_x = __config.width / 2 - __map_mc._x;
            __zoom_map_y = __config.height / 2 - __map_mc._y;
            this.__zoomTo(__data_source.zoom, __data_source.zoom_x, __data_source.zoom_y, true);
            this.__initSmallMap();
            this.__initObjectList();
        }
        else
        {
            __map_mc._x = com.ammap.Utils.getCoordinate(_loc8, __config.map_width);
            __map_mc._y = com.ammap.Utils.getCoordinate(_loc7, __config.map_height);
            __final_x = com.ammap.Utils.getCoordinate(_loc6, __config.map_width);
            __final_y = com.ammap.Utils.getCoordinate(_loc5, __config.map_height);
            __zoom_mc.dragger_mc._y = -((__zoom_level - 100) * __grid_step - __zoom_mc.minus_mc._y + __zoom_mc.dragger_mc._height);
            __zoom_map_x = (__config.width / 2 - __map_mc._x) / (__zoom_level / 100);
            __zoom_map_y = (__config.height / 2 - __map_mc._y) / (__zoom_level / 100);
            __zoom_level = com.ammap.Utils.roundTo(__map_mc._xscale, 4);
            this.__initObjectList();
            this.__initLegend();
            this.__initSmallMap();
        } // end else if
        if (__data.url != undefined && resize_only != true)
        {
            __click_interval = setInterval(this, "__click_home", 500);
        }
        else
        {
            this.__initObjects(__data);
        } // end else if
        this.__resizeObjects();
        if (__map_inited != true && __inited_interval == undefined)
        {
            __inited_interval = setInterval(this, "__initMap", 5000);
        } // end if
    } // End of the function
    function __click_home()
    {
        clearInterval(__click_interval);
        if (__data.url.substr(0, 1) == "#")
        {
            this.__getURL(__data.url);
        } // end if
    } // End of the function
    function __resizeObjects()
    {
        var _loc3 = 10000 / __zoom_level;
        for (var _loc2 = 0; _loc2 < __movies_to_resize.length; ++_loc2)
        {
            __movies_to_resize[_loc2]._xscale = _loc3;
            __movies_to_resize[_loc2]._yscale = _loc3;
            __movies_to_resize[_loc2]._visible = true;
        } // end of for
        __labels.resize(_loc3);
        for (var _loc2 = 0; _loc2 < __arrows_to_resize.length; ++_loc2)
        {
            __arrows_to_resize[_loc2]._xscale = _loc3;
            __arrows_to_resize[_loc2]._yscale = _loc3;
            __arrows_to_resize[_loc2]._visible = true;
        } // end of for
    } // End of the function
    function __makeMove()
    {
        __moved = true;
        __map_mc._x = __map_move_start_x + (_root._xmouse - __move_start_x);
        __map_mc._y = __map_move_start_y + (_root._ymouse - __move_start_y);
        __zoom_map_x = (__config.width / 2 - __map_mc._x) / (__zoom_level / 100);
        __zoom_map_y = (__config.height / 2 - __map_mc._y) / (__zoom_level / 100);
        this.__updateRectangle();
    } // End of the function
    function __makeZoom()
    {
        __zoom_level = com.ammap.Utils.roundTo(__config.zoom.min + Math.floor(__zoom_mc.minus_mc._y - __zoom_mc.dragger_mc._y - __zoom_mc.dragger_mc._height) / __grid_step, 4);
        __map_mc._xscale = __zoom_level;
        __map_mc._yscale = __zoom_level;
        __map_mc._x = -(__zoom_map_x * (__zoom_level / 100) - __config.width / 2);
        __map_mc._y = -(__zoom_map_y * (__zoom_level / 100) - __config.height / 2);
        this.__resizeObjects();
        this.__updateRectangle();
    } // End of the function
    function __zoomTo(zoom_level, x, y, instant)
    {
        var main_obj = this;
        __final_x = com.ammap.Utils.getCoordinate(x, __config.map_width);
        __final_y = com.ammap.Utils.getCoordinate(y, __config.map_height);
        __final_scale = zoom_level;
        if (x == undefined)
        {
            __final_x = -(__zoom_map_x * zoom_level / 100 - __config.width / 2);
        } // end if
        if (y == undefined)
        {
            __final_y = -(__zoom_map_y * zoom_level / 100 - __config.height / 2);
        } // end if
        if (__config.zoom.effect == "easein")
        {
            var _loc3 = mx.transitions.easing.Strong.easeIn;
        } // end if
        if (__config.zoom.effect == "easeout")
        {
            _loc3 = mx.transitions.easing.Strong.easeOut;
        } // end if
        __tween.stop();
        __tween = new mx.transitions.Tween(this, "__tween_percent", _loc3, 0, 1, __config.zoom.time, true);
        __tween.onMotionFinished = function ()
        {
            clearInterval(main_obj.__interval);
        };
        __initial_x = __map_mc._x;
        __initial_y = __map_mc._y;
        __initial_scale = __map_mc._xscale;
        if (instant == true)
        {
            __tween.stop();
            __tween_percent = 1;
        } // end if
        clearInterval(__interval);
        __interval = setInterval(this, "__moveMap", 20);
    } // End of the function
    function __moveMap()
    {
        if (__map_mc._visible == false)
        {
            __map_mc._visible = true;
        } // end if
        if (__tween_percent == 1)
        {
            clearInterval(__interval);
        } // end if
        __map_mc._x = __initial_x + (__final_x - __initial_x) * __tween_percent;
        __map_mc._y = __initial_y + (__final_y - __initial_y) * __tween_percent;
        var _loc2 = __initial_scale + (__final_scale - __initial_scale) * __tween_percent;
        __map_mc._xscale = _loc2;
        __map_mc._yscale = _loc2;
        __zoom_level = com.ammap.Utils.roundTo(__map_mc._xscale, 4);
        __zoom_map_x = (__config.width / 2 - __map_mc._x) / (__zoom_level / 100);
        __zoom_map_y = (__config.height / 2 - __map_mc._y) / (__zoom_level / 100);
        this.__resizeObjects();
        __zoom_mc.dragger_mc._y = -((__zoom_level - __config.zoom.min) * __grid_step - __zoom_mc.minus_mc._y + __zoom_mc.dragger_mc._height);
        this.__updateRectangle();
    } // End of the function
    function __initZoom()
    {
        __zoom_tool_mc = __mc.createEmptyMovieClip("zoom_tool_mc", __zoom_tool_depth);
        __zoom_tool_mc._x = com.ammap.Utils.getCoordinate(__config.zoom.x, __config.width);
        __zoom_tool_mc._y = com.ammap.Utils.getCoordinate(__config.zoom.y, __config.height);
        var main_obj = this;
        if (__config.zoom.min == undefined || __config.zoom.min == Infinity)
        {
            if (__config.width / __config.map_width < __config.height / __config.map_height)
            {
                __config.zoom.min = Math.round(__config.width / __config.map_width * 100);
            }
            else
            {
                __config.zoom.min = Math.round(__config.height / __config.map_height * 100);
            } // end if
        } // end else if
        if (__config.zoom.enabled == true)
        {
            __zoom_mc = __zoom_tool_mc.attachMovie("zoom_mc", "zoom_mc", 0);
            __zoom_mc.minus_mc._y = com.ammap.Utils.getCoordinate(__config.zoom.height, __config.height) - __zoom_mc.minus_mc._height;
            __zoom_mc.plus_mc._y = 0;
            __grid_step = (__zoom_mc.minus_mc._y - __zoom_mc.plus_mc._height) / (__config.zoom.max - __config.zoom.min + __config.zoom.grid_every);
            __zoom_mc.dragger_mc._height = __grid_step * __config.zoom.grid_every;
            __zoom_mc.dragger_mc._y = __zoom_mc.minus_mc._y - __zoom_mc.dragger_mc._height;
            for (var _loc3 = __config.zoom.min; _loc3 <= __config.zoom.max; ++_loc3)
            {
                if (_loc3 / __config.zoom.grid_every == Math.round(_loc3 / __config.zoom.grid_every))
                {
                    var _loc4 = __zoom_mc.attachMovie("grid_mc", "grid_mc" + _loc3, _loc3);
                    _loc4._y = __zoom_mc.minus_mc._y - __zoom_mc.dragger_mc._height - (_loc3 - __config.zoom.min) * __grid_step;
                    var _loc7 = new Color(_loc4);
                    _loc7.setRGB(__config.zoom.outline_color);
                    _loc4._alpha = __config.zoom.outline_alpha;
                } // end if
            } // end of for
            __zoom_mc.dragger_mc.swapDepths(__config.zoom.max + 100);
            if (__config.zoom.rotate == true)
            {
                __zoom_mc._rotation = 90;
                __zoom_mc._x = __zoom_mc._x + __zoom_mc._width;
                __zoom_mc.minus_mc.sign_mc._rotation = -90;
                __zoom_mc.plus_mc.sign_mc._rotation = -90;
            } // end if
            var t = __zoom_mc.plus_mc._height;
            var b = __zoom_mc.minus_mc._y - __zoom_mc.dragger_mc._height;
            __zoom_mc.dragger_mc.onPress = function ()
            {
                main_obj.__zoom_map_x = (main_obj.__config.width / 2 - main_obj.__map_mc._x) / (main_obj.__zoom_level / 100);
                main_obj.__zoom_map_y = (main_obj.__config.height / 2 - main_obj.__map_mc._y) / (main_obj.__zoom_level / 100);
                _global.drag_busy = this;
                main_obj.__zooming = true;
                startDrag (this, false, 0, t, 0, b);
            };
            __zoom_mc.dragger_mc.onRelease = __zoom_mc.dragger_mc.onReleaseOutside = function ()
            {
                main_obj.__zooming = false;
                stopDrag ();
                var _loc2 = new Color(bg_mc);
                _loc2.setRGB(main_obj.__config.zoom.color);
            };
            __zoom_mc.dragger_mc.onRollOver = __zoom_mc.plus_mc.onRollOver = __zoom_mc.minus_mc.onRollOver = function ()
            {
                var _loc2 = new Color(bg_mc);
                _loc2.setRGB(main_obj.__config.zoom.color_hover);
            };
            __zoom_mc.dragger_mc.onRollOut = __zoom_mc.plus_mc.onRollOut = __zoom_mc.minus_mc.onRollOut = function ()
            {
                var _loc2 = new Color(bg_mc);
                _loc2.setRGB(main_obj.__config.zoom.color);
            };
            __zoom_mc.plus_mc.onRelease = function ()
            {
                main_obj.__zoomIn();
            };
            __zoom_mc.minus_mc.onRelease = function ()
            {
                main_obj.__zoomOut();
            };
        } // end if
        if (__config.zoom.arrows_enabled == true)
        {
            __nav_mc = __zoom_tool_mc.attachMovie("nav_mc", "nav_mc", 1);
            if (__config.zoom.home_link_enabled == false)
            {
                __nav_mc.home_mc._visible = false;
            } // end if
            if (__config.zoom.rotate == false)
            {
                __zoom_mc._x = __nav_mc._width / 3;
                __zoom_mc._y = __nav_mc._height + 15;
            }
            else
            {
                __zoom_mc._x = __nav_mc._width + 15 + __zoom_mc._width;
                __zoom_mc._y = __nav_mc._height / 3;
            } // end else if
            __nav_mc.top_mc.onRollOver = __nav_mc.bottom_mc.onRollOver = __nav_mc.left_mc.onRollOver = __nav_mc.right_mc.onRollOver = function ()
            {
                var _loc2 = new Color(bg_mc);
                _loc2.setRGB(main_obj.__config.zoom.color_hover);
            };
            __nav_mc.top_mc.onRollOut = __nav_mc.top_mc.onReleaseOutside = __nav_mc.bottom_mc.onRollOut = __nav_mc.bottom_mc.onReleaseOutside = __nav_mc.left_mc.onRollOut = __nav_mc.left_mc.onReleaseOutside = __nav_mc.right_mc.onRollOut = __nav_mc.right_mc.onReleaseOutside = function ()
            {
                var _loc2 = new Color(bg_mc);
                _loc2.setRGB(main_obj.__config.zoom.color);
            };
            __nav_mc.top_mc.x_dir = 0;
            __nav_mc.top_mc.y_dir = 1;
            __nav_mc.bottom_mc.x_dir = 0;
            __nav_mc.bottom_mc.y_dir = -1;
            __nav_mc.left_mc.x_dir = 1;
            __nav_mc.left_mc.y_dir = 0;
            __nav_mc.right_mc.x_dir = -1;
            __nav_mc.right_mc.y_dir = 0;
            __nav_mc.top_mc.onRelease = __nav_mc.bottom_mc.onRelease = __nav_mc.left_mc.onRelease = __nav_mc.right_mc.onRelease = function ()
            {
                var _loc3 = main_obj.__map_mc._x + x_dir * main_obj.__config.width * main_obj.__config.zoom.step_size / 100;
                var _loc2 = main_obj.__map_mc._y + y_dir * main_obj.__config.height * main_obj.__config.zoom.step_size / 100;
                main_obj.__zoomTo(main_obj.__zoom_level, _loc3, _loc2);
            };
            __nav_mc.home_mc.onPress = function ()
            {
                if (main_obj.__config.zoom.locked != true)
                {
                    startDrag (main_obj.__zoom_tool_mc, false);
                } // end if
                old_x = main_obj.__zoom_tool_mc._x;
                old_y = main_obj.__zoom_tool_mc._y;
                _global.drag_busy = this;
            };
            __nav_mc.home_mc.onRelease = function ()
            {
                _global.drag_busy = false;
                stopDrag ();
                if (main_obj.__zoom_tool_mc._x == old_x && main_obj.__zoom_tool_mc._y == old_y)
                {
                    main_obj.__getURL("#top");
                } // end if
            };
        } // end if
        var _loc5 = [__zoom_mc.minus_mc.border_mc, __zoom_mc.minus_mc.sign_mc, __zoom_mc.plus_mc.border_mc, __zoom_mc.plus_mc.sign_mc, __zoom_mc.dragger_mc.border_mc, __nav_mc.top_mc.border_mc, __nav_mc.top_mc.arrow_mc, __nav_mc.bottom_mc.border_mc, __nav_mc.bottom_mc.arrow_mc, __nav_mc.left_mc.border_mc, __nav_mc.left_mc.arrow_mc, __nav_mc.right_mc.border_mc, __nav_mc.right_mc.arrow_mc, __nav_mc.home_mc];
        var _loc6 = [__zoom_mc.minus_mc.bg_mc, __zoom_mc.plus_mc.bg_mc, __zoom_mc.dragger_mc.bg_mc, __nav_mc.top_mc.bg_mc, __nav_mc.bottom_mc.bg_mc, __nav_mc.left_mc.bg_mc, __nav_mc.right_mc.bg_mc];
        for (var _loc3 = 0; _loc3 < _loc5.length; ++_loc3)
        {
            _loc7 = new Color(_loc5[_loc3]);
            _loc7.setRGB(__config.zoom.outline_color);
            _loc5[_loc3]._alpha = __config.zoom.outline_alpha;
        } // end of for
        for (var _loc3 = 0; _loc3 < _loc6.length; ++_loc3)
        {
            _loc7 = new Color(_loc6[_loc3]);
            _loc7.setRGB(__config.zoom.color);
            _loc6[_loc3]._alpha = __config.zoom.alpha;
        } // end of for
    } // End of the function
    function __zoomIn()
    {
        if (__zoom_level < __config.zoom.max)
        {
            var _loc2 = Math.ceil(__zoom_level + __config.zoom.grid_every);
            this.__zoomTo(com.ammap.Utils.fitToBounds(_loc2, __config.zoom.min, __config.zoom.max));
        } // end if
    } // End of the function
    function __zoomOut()
    {
        if (__zoom_level > __config.zoom.min)
        {
            var _loc2 = Math.floor(__zoom_level - __config.zoom.grid_every);
            this.__zoomTo(com.ammap.Utils.fitToBounds(_loc2, __config.zoom.min, __config.zoom.max));
        } // end if
    } // End of the function
    function __initLegend()
    {
        if (__config.legend.enabled == true && __config.legend.entries.entry.length > 0)
        {
            new com.ammap.Legend(__mc, "legend", __legend_depth, __config);
        } // end if
    } // End of the function
    function __initObjectList()
    {
        if (__config.object_list.enabled == true)
        {
            var main_obj = this;
            var _loc3 = com.ammap.Utils.getCoordinate(__config.object_list.width, __config.width);
            var _loc4 = com.ammap.Utils.getCoordinate(__config.object_list.height, __config.height);
            __object_list.die();
            __object_list = new com.ammap.ComboBox(__mc, "object_list_mc", __object_list_depth, _loc3, _loc4, __config.object_list.type, __config.object_list);
            __object_list.addItem(__config.object_list.home_text, __data);
            __data.object_list_index = 0;
            this.__addItemsToList(__data, 0);
            __object_list.show();
            __object_list.selectItem(0);
            __object_list.mc._x = com.ammap.Utils.getCoordinate(__config.object_list.x, __config.width) - 1;
            __object_list.mc._y = com.ammap.Utils.getCoordinate(__config.object_list.y, __config.height);
            var main_obj = this;
            var _loc2 = new Object();
            _loc2.onChange = function (data_source)
            {
                main_obj.__clickItem(data_source);
            };
            _loc2.onRollOver = function (data_source)
            {
                main_obj.__hoverItem(data_source, true);
            };
            _loc2.onRollOut = function (data_source)
            {
                main_obj.__rollOutItem(data_source);
            };
            __object_list.addListener(_loc2);
        } // end if
    } // End of the function
    function __addItemsToList(data_source, level)
    {
        var _loc5 = "";
        for (var _loc4 = 0; _loc4 < level; ++_loc4)
        {
            _loc5 = _loc5 + "  ";
        } // end of for
        if (level > 0)
        {
            _loc5 = _loc5 + "- ";
        } // end if
        if (__config.object_list.include_areas == true)
        {
            for (var _loc4 = 0; _loc4 < data_source.areas.area.length; ++_loc4)
            {
                if (data_source.areas.area[_loc4].object_list == true && data_source.areas.area[_loc4].title != "")
                {
                    data_source.areas.area[_loc4].object_list_index = __object_list.addItem(_loc5 + "" + data_source.areas.area[_loc4].title, data_source.areas.area[_loc4]);
                    if (data_source.areas.area[_loc4].movies.movie.length > 0 && level < __config.object_list.levels - 1)
                    {
                        this.__addItemsToList(data_source.areas.area[_loc4], level + 1);
                    } // end if
                    if (data_source.areas.area[_loc4].labels.label.length > 0 && level < __config.object_list.levels - 1)
                    {
                        this.__addItemsToList(data_source.areas.area[_loc4], level + 1);
                    } // end if
                } // end if
            } // end of for
        } // end if
        if (__config.object_list.include_movies == true)
        {
            for (var _loc4 = 0; _loc4 < data_source.movies.movie.length; ++_loc4)
            {
                if (data_source.movies.movie[_loc4].object_list == true && data_source.movies.movie[_loc4].title != "")
                {
                    data_source.movies.movie[_loc4].object_list_index = __object_list.addItem(_loc5 + "" + data_source.movies.movie[_loc4].title, data_source.movies.movie[_loc4]);
                    if (data_source.movies.movie[_loc4].movies.movie.length > 0 && level < __config.object_list.levels - 1)
                    {
                        this.__addItemsToList(data_source.movies.movie[_loc4], level + 1);
                    } // end if
                    if (data_source.movies.movie[_loc4].labels.label.length > 0 && level < __config.object_list.levels - 1)
                    {
                        this.__addItemsToList(data_source.movies.movie[_loc4], level + 1);
                    } // end if
                } // end if
            } // end of for
        } // end if
        if (__config.object_list.include_labels == true)
        {
            for (var _loc4 = 0; _loc4 < data_source.labels.label.length; ++_loc4)
            {
                if (data_source.labels.label[_loc4].object_list == true && data_source.labels.label[_loc4].title != "")
                {
                    data_source.labels.label[_loc4].object_list_index = __object_list.addItem(_loc5 + "" + data_source.labels.label[_loc4].title, data_source.labels.label[_loc4]);
                    if (data_source.labels.label[_loc4].movies.movie.length > 0 && level < __config.object_list.levels - 1)
                    {
                        this.__addItemsToList(data_source.labels.label[_loc4], level + 1);
                    } // end if
                    if (data_source.labels.label[_loc4].labels.label.length > 0 && level < __config.object_list.levels - 1)
                    {
                        this.__addItemsToList(data_source.labels.label[_loc4], level + 1);
                    } // end if
                } // end if
            } // end of for
        } // end if
    } // End of the function
    function __initSmallMap()
    {
        if (__config.small_map.enabled == true)
        {
            var main_obj = this;
            __small_map_tool_mc = __mc.createEmptyMovieClip("small_map_tool_mc", __small_map_depth);
            __small_map_tool_mc._visible = false;
            __small_map_mc = __small_map_tool_mc.createEmptyMovieClip("small_map_mc", 0);
            __small_map_width = com.ammap.Utils.getCoordinate(__config.small_map.width, __config.width) - 2 * __config.small_map.border_width;
            __small_map_height = __small_map_width * (__map_container_mc._height / __map_container_mc._width) - 2 * __config.small_map.border_width;
            if (__config.small_map.x == undefined)
            {
                __small_map_tool_mc._x = __config.width - __small_map_width - __config.small_map.border_width;
            }
            else
            {
                __small_map_tool_mc._x = com.ammap.Utils.getCoordinate(__config.small_map.x, __config.width);
            } // end else if
            if (__config.small_map.y == undefined)
            {
                __small_map_tool_mc._y = __config.height - __small_map_height - __config.small_map.border_width;
            }
            else
            {
                __small_map_tool_mc._y = com.ammap.Utils.getCoordinate(__config.small_map.y, __config.height);
            } // end else if
            var _loc4 = new com.ammap.Rectangle(__small_map_mc, "border_mc", 0, __small_map_width + 2 * __config.small_map.border_width, __small_map_height + 2 * __config.small_map.border_width, __config.small_map.border_color);
            _loc4.mc._x = -__config.small_map.border_width;
            _loc4.mc._y = -__config.small_map.border_width;
            _loc4.mc.onRollOver = function ()
            {
                useHandCursor = false;
            };
            if (__config.small_map.locked != true)
            {
                _loc4.mc.onPress = function ()
                {
                    old_x = main_obj.__small_map_tool_mc._x;
                    old_y = main_obj.__small_map_tool_mc._y;
                    _global.drag_busy = this;
                    startDrag (main_obj.__small_map_tool_mc, false);
                };
                _loc4.mc.onRelease = function ()
                {
                    stopDrag ();
                    _global.drag_busy = false;
                };
            } // end if
            var _loc6 = new com.ammap.Rectangle(__small_map_mc, "bg_mc", 1, __small_map_width, __small_map_height, __config.background.color);
            _loc6.mc.onRollOver = function ()
            {
                useHandCursor = false;
            };
            _loc6.mc.onPress = function ()
            {
                _global.drag_busy = this;
                if (main_obj.__config.small_map.active != false)
                {
                    var _loc3 = main_obj.__small_map_width / main_obj.__map_container_mc._width;
                    var _loc5 = -(_xmouse - main_obj.__rectangle_mc._width / 2) * main_obj.__zoom_level / 100 / _loc3;
                    var _loc4 = -(_ymouse - main_obj.__rectangle_mc._height / 2) * main_obj.__zoom_level / 100 / _loc3;
                    main_obj.__zoomTo(main_obj.__zoom_level, _loc5, _loc4);
                } // end if
            };
            var _loc3 = __small_map_tool_mc.attachMovie("collapse_mc", "collapse_mc", 2);
            var _loc7 = new Color(_loc3.bg_mc);
            _loc7.setRGB(__config.small_map.border_color);
            _loc7 = new Color(_loc3.arrow_mc);
            _loc7.setRGB(__config.small_map.collapse_button_color);
            _loc3.onPress = function ()
            {
                _global.drag_busy = this;
            };
            _loc3.onRelease = function ()
            {
                if (main_obj.__small_map_mc._visible == false)
                {
                    main_obj.__small_map_mc._visible = true;
                }
                else
                {
                    main_obj.__small_map_mc._visible = false;
                } // end else if
            };
            if (__config.small_map.collapse_button_position == "tl")
            {
                _loc3._x = -__config.small_map.border_width;
                _loc3._y = -__config.small_map.border_width;
            } // end if
            if (__config.small_map.collapse_button_position == "tr")
            {
                _loc3._x = __small_map_width - _loc3._width + __config.small_map.border_width;
                _loc3._y = -__config.small_map.border_width;
            } // end if
            if (__config.small_map.collapse_button_position == "br")
            {
                _loc3._x = __small_map_width - _loc3._width + __config.small_map.border_width;
                _loc3._y = __small_map_height - _loc3._height + __config.small_map.border_width;
            } // end if
            if (__config.small_map.collapse_button_position == "bl")
            {
                _loc3._y = __small_map_height - _loc3._height + __config.small_map.border_width;
                _loc3._x = -__config.small_map.border_width;
            } // end if
            var _loc8 = new com.ammap.Rectangle(__small_map_mc, "mask_mc", 5, __small_map_width, __small_map_height, __config.background.color);
            var _loc12 = _loc8.mc;
            _loc8 = new com.ammap.Rectangle(__small_map_mc, "mask_mc2", 6, __small_map_width, __small_map_height, __config.background.color);
            __small_map_mask_mc = _loc8.mc;
            __small_map_container_mc = __small_map_mc.createEmptyMovieClip("small_map_container_mc", 3);
            var _loc13 = new com.ammap.Load();
            _loc13.loadClip(__config.path + __data.map_file, __small_map_container_mc, this, "__resizeSmallMap", false, "__error", [__small_map_width, __small_map_height]);
            if (__config.small_map.color != undefined)
            {
                _loc7 = new Color(__small_map_container_mc);
                _loc7.setRGB(__config.small_map.color);
            } // end if
            var _loc9 = new com.ammap.Rectangle(__small_map_mc, "rectangle_mc", 10, __small_map_width, __small_map_height, 0, 0, __config.small_map.rectangle_color, 0, 0, 100);
            __rectangle_mc = _loc9.mc;
            __rectangle_mc.setMask(_loc12);
            this.__updateRectangle();
        } // end if
    } // End of the function
    function __updateRectangle()
    {
        var _loc2 = __small_map_width / __map_container_mc._width;
        __rectangle_mc._x = -__map_mc._x / (__zoom_level / 100) * _loc2;
        __rectangle_mc._y = -__map_mc._y / (__zoom_level / 100) * _loc2;
        __rectangle_mc._width = __config.width / (__zoom_level / 100) * _loc2;
        __rectangle_mc._height = __config.height / (__zoom_level / 100) * _loc2;
    } // End of the function
    function __resizeSmallMap(movie_mc, params)
    {
        __small_map_tool_mc._visible = true;
        movie_mc.setMask(__small_map_mask_mc);
        movie_mc._width = params[0];
        movie_mc._height = params[1];
    } // End of the function
    function __initMouseListener()
    {
        var main_obj = this;
        __mouse_listener = new Object();
        __mouse_listener.onMouseMove = function ()
        {
            if (main_obj.__balloon_mc._visible == true)
            {
                main_obj.__balloon.pointTo(main_obj.__target_mc._xmouse, main_obj.__target_mc._ymouse);
            } // end if
            if (main_obj.__zooming == true)
            {
                main_obj.__makeZoom();
            } // end if
            if (_global.drag_busy == this)
            {
                main_obj.__makeMove();
            } // end if
            main_obj.__setDeveloperText();
        };
        __mouse_listener.onMouseDown = function ()
        {
            _global.drag_busy = this;
            main_obj.__moved = false;
            clearInterval(main_obj.__interval);
            main_obj.__balloon_mc._visible = false;
            if (main_obj.__config.drag_map == true)
            {
                _global.drag_busy = this;
                main_obj.__stopTween();
                main_obj.__move_start_x = _root._xmouse;
                main_obj.__move_start_y = _root._ymouse;
                main_obj.__map_move_start_x = main_obj.__map_mc._x;
                main_obj.__map_move_start_y = main_obj.__map_mc._y;
            } // end if
        };
        __mouse_listener.onMouseUp = function ()
        {
            _global.drag_busy = false;
        };
        if (__config.zoom.mouse_wheel_enabled == true)
        {
            __mouse_listener.onMouseWheel = function (delta)
            {
                if (_global.wheel_busy == false)
                {
                    if (delta > 0)
                    {
                        main_obj.__zoomIn();
                    }
                    else
                    {
                        main_obj.__zoomOut();
                    } // end if
                } // end else if
            };
        } // end if
        Mouse.removeListener(__mouse_listener);
        Mouse.addListener(__mouse_listener);
    } // End of the function
    function __initAreas()
    {
        var main_obj = this;
        for (var _loc3 = 0; _loc3 < __data.areas.area.length; ++_loc3)
        {
            var _loc2 = __map_container_mc[__data.areas.area[_loc3].mc_name];
            __data.areas.area[_loc3].mc = _loc2;
            _loc2.data_source = __data.areas.area[_loc3];
            var _loc4 = new Color(_loc2);
            _loc4.setRGB(__config.area.color_light);
            _loc2._alpha = __data.areas.area[_loc3].alpha;
            _loc2.onRollOver = function ()
            {
                no_hover = false;
                if (main_obj.__config.area.disable_when_clicked == true)
                {
                    if (main_obj.__data_source == data_source)
                    {
                        useHandCursor = false;
                        no_hover = true;
                    } // end if
                    for (var _loc2 = 0; _loc2 < main_obj.__config.selected_data_source.link_with.length; ++_loc2)
                    {
                        if (main_obj.__config.selected_data_source.link_with[_loc2] == data_source.oid)
                        {
                            useHandCursor = false;
                            no_hover = true;
                        } // end if
                    } // end of for
                } // end if
                if (no_hover == false)
                {
                    useHandCursor = true;
                    main_obj.__hoverItem(data_source);
                } // end if
            };
            _loc2.onRollOut = _loc2.onReleaseOutside = function ()
            {
                if (main_obj.__config.area.disable_when_clicked == true && main_obj.__data_source == data_source || no_hover == true)
                {
                }
                else
                {
                    main_obj.__balloon_mc._visible = false;
                    if (main_obj.__config.text_box.hide_on_roll_out == true)
                    {
                        main_obj.__hideTextBox();
                    } // end if
                    main_obj.__rollOutItem(data_source);
                } // end else if
            };
            _loc2.onRelease = function ()
            {
                if (main_obj.__config.area.disable_when_clicked == true && main_obj.__data_source == data_source)
                {
                }
                else
                {
                    useHandCursor = false;
                    main_obj.__clickItem(data_source);
                } // end else if
            };
            _loc2.fader = new com.ammap.FadeColor(_loc2);
            _loc2.fader.fadeTo(__data.areas.area[_loc3].color, __config.color_change_time_start);
        } // end of for
    } // End of the function
    function __getURL(url)
    {
        clearInterval(__time_out);
        if (url == undefined)
        {
            url = __data_source.url;
        } // end if
        if (url == "#top")
        {
            this.__clickItem(__data);
            return;
        } // end if
        if (url == "#parent")
        {
            this.__clickItem(__data_source.parent.parent);
            return;
        } // end if
        if (url.substr(0, 1) == "#")
        {
            var _loc3 = __data.by_id[url.substr(1)];
            if (_loc3 == undefined)
            {
                __data.url = undefined;
                _loc3 = __data;
            } // end if
            this.__clickItem(_loc3);
            return;
        } // end if
        if (url != undefined && com.ammap.Utils.stripSymbols(url, " ") != "")
        {
            if (url.substr(0, 1) == "!")
            {
                __movies.die();
                __target_mc.data_file = url.substr(1);
                __target_mc.loadData();
            }
            else
            {
                getURL(url, __data_source.target);
            } // end if
        } // end else if
        this.__initObjects(__data_source);
        if (__data_source.text_box == true && __data_source.description != undefined && __data_source.description != "")
        {
            this.__showTextBox(__data_source);
        } // end if
        this.__resizeObjects();
    } // End of the function
    function __clickItem(data_source)
    {
        if (__moved != true)
        {
            flash.external.ExternalInterface.call("amRegisterClick", __config.map_id, data_source.oid, data_source.title, data_source.value);
        } // end if
        if (__moved != true && com.ammap.Utils.checkIfClickable(data_source) == true)
        {
            if (__data_source.color != undefined)
            {
                var _loc3 = new Color(__data_source.mc);
                _loc3.setRGB(__data_source.color);
            } // end if
            this.__changeColorLinked(__data_source, "color");
            if (data_source.color_selected != undefined)
            {
                _loc3 = new Color(data_source.mc);
                _loc3.setRGB(data_source.color_selected);
            } // end if
            __map_mc.movies_mc._visible = false;
            __map_mc.lines_mc._visible = false;
            __map_mc.labels_mc._visible = false;
            this.__hideTextBox();
            __data_source = data_source;
            __config.selected_data_source = __data_source;
            if (data_source.zoom != undefined)
            {
                this.__zoomTo(data_source.zoom, data_source.zoom_x, data_source.zoom_y);
                clearInterval(__time_out);
                __time_out = setInterval(this, "__getURL", __config.zoom.time * 1000);
            }
            else
            {
                this.__getURL();
            } // end else if
            if (data_source.top == true)
            {
                __navigation_path.clearPath();
            }
            else
            {
                __navigation_path.registerClick(data_source);
            } // end else if
            this.__changeColorLinked(data_source, "color_selected");
            if (__config.object_list.enabled == true)
            {
                __object_list.selectItem(data_source.object_list_index);
            } // end if
        } // end if
    } // End of the function
    function __hideTextBox()
    {
        if (__text_box_mc != undefined && __text_box_mc != "")
        {
            __text_box_mc._visible = false;
        } // end if
    } // End of the function
    function __hoverItem(data_source, object_list)
    {
        var _loc3 = data_source.mc;
        _loc3.fader.stop();
        if (com.ammap.Utils.checkIfClickable(data_source) != true)
        {
            _loc3.useHandCursor = false;
        } // end if
        flash.external.ExternalInterface.call("amRegisterHover", __config.map_id, data_source.oid, data_source.title, data_source.value);
        if (data_source.balloon == true)
        {
            if (data_source.color_hover != undefined)
            {
                var _loc4 = new Color(_loc3);
                _loc4.setRGB(data_source.color_hover);
            } // end if
            if (object_list != true)
            {
                var _loc5 = com.ammap.Utils.formatText(__config, __config[data_source.type].balloon_text, data_source.title, data_source.value, data_source.percent, data_source.description);
                this.__showBalloon(_loc5);
            } // end if
        } // end if
        this.__changeColorLinked(data_source, "color_hover");
        if (data_source.text_box == true && data_source.description != undefined && data_source.description != "" && __config.text_box.show_on_hover == true)
        {
            this.__showTextBox(data_source, false);
        } // end if
    } // End of the function
    function __changeColorLinked(data_source, color_name)
    {
        if (data_source.link_with != undefined)
        {
            for (var _loc3 = 0; _loc3 < data_source.link_with.length; ++_loc3)
            {
                var _loc2 = __data.by_id[data_source.link_with[_loc3]];
                _loc2.mc.fader.stop();
                if (_loc2[color_name] != undefined)
                {
                    var _loc4 = new Color(_loc2.mc);
                    _loc4.setRGB(_loc2[color_name]);
                } // end if
            } // end of for
        } // end if
    } // End of the function
    function __rollOutItem(data_source)
    {
        if (__config.selected_data_source == data_source)
        {
            if (data_source.color_selected != undefined)
            {
                data_source.mc.fader = new com.ammap.FadeColor(data_source.mc);
                data_source.mc.fader.fadeTo(data_source.color_selected, __config.color_change_time_hover);
            } // end if
            if (data_source.link_with != undefined)
            {
                for (var _loc4 = 0; _loc4 < data_source.link_with.length; ++_loc4)
                {
                    var _loc2 = __data.by_id[data_source.link_with[_loc4]];
                    if (_loc2.color_hover != undefined)
                    {
                        _loc2.mc.fader = new com.ammap.FadeColor(_loc2.mc);
                        _loc2.mc.fader.fadeTo(_loc2.color_selected, __config.color_change_time_hover);
                    } // end if
                } // end of for
            } // end if
        }
        else
        {
            if (data_source.color != undefined)
            {
                data_source.mc.fader = new com.ammap.FadeColor(data_source.mc);
                data_source.mc.fader.fadeTo(data_source.color, __config.color_change_time_hover);
            } // end if
            if (data_source.link_with != undefined)
            {
                for (var _loc4 = 0; _loc4 < data_source.link_with.length; ++_loc4)
                {
                    _loc2 = __data.by_id[data_source.link_with[_loc4]];
                    if (_loc2.color_hover != undefined)
                    {
                        _loc2.mc.fader = new com.ammap.FadeColor(_loc2.mc);
                        _loc2.mc.fader.fadeTo(_loc2.color, __config.color_change_time_hover);
                    } // end if
                } // end of for
            } // end if
        } // end else if
    } // End of the function
    function __showBalloon(balloon_text)
    {
        if (__config.balloon.enabled == true)
        {
            if (balloon_text != "" && balloon_text != undefined && balloon_text != " ")
            {
                __balloon = new com.ammap.Balloon(__mc, "balloon_mc", __balloon_depth, balloon_text, 0, 0, __config.width, __config.height, com.ammap.Utils.getCoordinate(__config.balloon.max_width, __config.width), __config);
                __balloon.__set__distance(12);
                __balloon.__set__hMargins(12 - __config.balloon.corner_radius / 2);
                __balloon.__set__pointerWidth(20);
                __balloon.__set__vMargins(5 - __config.balloon.corner_radius / 2);
                __balloon.__set__bgColor(__config.balloon.color);
                __balloon.__set__borderColor(__config.balloon.border_color);
                __balloon.__set__bgAlpha(__config.balloon.alpha);
                __balloon.__set__borderAlpha(__config.balloon.border_alpha);
                __balloon.__set__borderWidth(__config.balloon.border_width);
                __balloon.__set__textColor(__config.balloon.text_color);
                __balloon.__set__textSize(__config.balloon.text_size);
                __balloon.__set__pointerPosition(__config.balloon.arrow);
                __balloon.__set__cornerRadius(__config.balloon.corner_radius);
                __balloon.show();
                __balloon.pointTo(__target_mc._xmouse, __target_mc._ymouse);
                __balloon_mc = __balloon.mc;
            } // end if
        } // end if
    } // End of the function
    function __showTextBox(data_source, show_x)
    {
        var _loc5 = this;
        var _loc3 = com.ammap.Utils.getCoordinate(data_source.text_box_width, __config.width);
        var _loc4 = com.ammap.Utils.getCoordinate(data_source.text_box_height, __config.height);
        __text_box.die();
        __text_box = new com.ammap.Window(__mc, "text_box_mc", __text_box_depth, data_source.title, _loc3, _loc4, __config.text_box.color, __config.text_box.alpha, __config.text_box.corner_radius);
        __text_box_mc = __text_box.mc;
        __text_box.border(__config.text_box.border_color, __config.text_box.border_alpha, __config.text_box.border_width);
        __text_box.scroller(__config.text_box.scroller_color, __config.text_box.scroller_bg_color, 15);
        __text_box.text(__config.text_box.text_size, __config.text_box.text_color);
        __text_box.shadow(__config.text_box.shadow_color, __config.text_box.shadow_alpha, __config.text_box.shadow_blur, __config.text_box.shadow_distance);
        __text_box.closeButton(__config.text_box.close_button_color, __config.text_box.close_button_color_hover);
        __text_box.locked = __config.text_box.locked;
        __text_box.margin_width = __config.text_box.margin_width;
        __text_box_mc._x = com.ammap.Utils.getCoordinate(data_source.text_box_x, __config.width);
        __text_box_mc._y = com.ammap.Utils.getCoordinate(data_source.text_box_y, __config.height);
        __text_box.content = data_source.description;
        __text_box.show();
        if (show_x == false)
        {
            __text_box.hideX();
        } // end if
    } // End of the function
    function __error(string)
    {
        new com.ammap.PopUp(__mc, "popup_mc", __preloader_depth, string, (__config.width - __config.width * 8.000000E-001) / 2, __config.height / 2.500000E+000, __config.width * 8.000000E-001, 12303104, 16777215);
    } // End of the function
	
	// modify by tony
    function __setDeveloperText()
    {
		var _cons_test = "__mc._xmouse=" + __mc._xmouse + ", __mc._ymouse=" + __mc._ymouse + "<br>"
			+ "__map_mc._x=" + __map_mc._x + ", __map_mc._y=" + __map_mc._y + "<br>"
			+ "__config.map_width=" + __config.map_width + ", __config.map_height=" + __config.map_height + "<br>"
			+ "__map_mc._xmouse=" + __map_mc._xmouse + ", __map_mc._ymouse=" + __map_mc._ymouse;
        __xy = "x=\"" + Math.round(__mc._xmouse) + "\" y=\"" + Math.round(__mc._ymouse) + "\"";
        __xyp = "x=\"" + com.ammap.Utils.roundTo(__mc._xmouse / __config.width * 100, 4) + "%\" y=\"" + com.ammap.Utils.roundTo(__mc._ymouse / __config.height * 100, 4) + "%\"";
        __zoom_info = "zoom=\"" + __zoom_level + "%\" zoom_x=\"" + com.ammap.Utils.roundTo(__map_mc._x / __config.map_width * 100, 2) + "%\" zoom_y=\"" + com.ammap.Utils.roundTo(__map_mc._y / __config.map_height * 100, 2) + "%\"";
        __long = com.ammap.Utils.roundTo(__map_mc._xmouse / __config.map_width * (__data.br_long - __data.tl_long) + __data.tl_long, 4);
        __lat = com.ammap.Utils.roundTo(__map_mc._ymouse / __config.map_height * (__data.br_lat - __data.tl_lat) + __data.tl_lat, 4);
        if (__config.projection == "mercator")
        {
            __lat = com.ammap.Utils.pixelsToMercatorLatitude(__config.projection, __map_mc._ymouse, __data.tl_lat, __data.br_lat, __config.map_height);
        } // end if
        __long_lat = "long=\"" + __long + "\" lat=\"" + __lat + "\"";
		
		var _long_lat_test = "calc_long=" + getXbyLong(__long) + ", calc_lat=" + getYBYLat(__lat);
		
        __developer_tf.__set__htmlTxt(_cons_test + "<br>" + _long_lat_test + "<br>" + __long_lat + "<br>" + __xy + "<br>" + __xyp + "<br>" + __zoom_info + "<br><b>Right click to copy this info to clipboard</b>");
    
		FlashInterface.dispatchEvent({type:'mouseMove', data:{coordx:__map_mc._x, coordy:__map_mc._y, zoom:__zoom_level}});
        /*FlashInterface.dispatchEvent({type:'mouseMove', 
									 data:{x:__mc._xmouse, 
									 y:__mc._ymouse,
									 long:__long,
									 lat:__lat,
									 xp:__mc._xmouse / __config.width,
									 yp:__mc._ymouse / __config.height,
									 zoom:__zoom_level,
									 zoomx:__map_mc._x / __config.map_width,
									 zoomy:__map_mc._y / __config.map_height}});*/
    } // End of the function
	// end of tony
	
    function __stageListener()
    {
        Stage.removeListener(__stage_listener);
        var main_obj = this;
        __stage_listener = new Object();
        __stage_listener.onResize = function ()
        {
            main_obj.__resize_time = 10;
        };
        Stage.addListener(__stage_listener);
        clearInterval(__resize_interval);
        __resize_interval = setInterval(__countResizeTime, 20, [this]);
        __resize_time = 2;
    } // End of the function
    function __countResizeTime(params)
    {
        if (params[0].__resize_time > 0)
        {
            --params[0].__resize_time;
        } // end if
        if (params[0].__resize_time == 1)
        {
            params[0].__config.width = Stage.width;
            params[0].__config.height = Stage.height;
            params[0].__resizeMap(params[0].__map_container_mc, true);
        } // end if
    } // End of the function
    function __initMap()
    {
        clearInterval(__inited_interval);
        __map_inited = true;
        flash.external.ExternalInterface.call("amMapCompleted", __config.map_id);
    } // End of the function
    function die()
    {
        clearInterval(__resize_interval);
        __movies.die();
        __text_box.die();
        __object_list.die();
        Stage.removeListener(__stage_listener);
        Mouse.removeListener(__mouse_listener);
    } // End of the function
    function clickObject(i)
    {
        this.__getURL("#" + i);
    } // End of the function
    function setZoom(zoom, zoom_x, zoom_y, instant)
    {
        zoom = com.ammap.Utils.toNumber(com.ammap.Utils.stripSymbols(zoom, "%"));
        this.__zoomTo(zoom, zoom_x, zoom_y, com.ammap.Utils.parseTrue(instant));
    } // End of the function
    function copyLongLat()
    {
        System.setClipboard(__long_lat);
    } // End of the function
    function copyStageXY()
    {
        System.setClipboard(__xy);
    } // End of the function
    function copyStageXYP()
    {
        System.setClipboard(__xyp);
    } // End of the function
    function copyZoomInfo()
    {
        System.setClipboard(__zoom_info);
    } // End of the function
    function get long()
    {
        return (__long);
    } // End of the function
    function get lat()
    {
        return (__lat);
    } // End of the function
    function get stage_x()
    {
        return (__mc._xmouse);
    } // End of the function
    function get stage_y()
    {
        return (__mc._ymouse);
    } // End of the function
    function get stage_xp()
    {
        return (com.ammap.Utils.roundTo(__mc._xmouse / __config.width * 100, 4) + "%");
    } // End of the function
    function get stage_yp()
    {
        return (com.ammap.Utils.roundTo(__mc._ymouse / __config.height * 100, 4) + "%");
    } // End of the function

    function get zoom_x()
    {
        return (com.ammap.Utils.roundTo(__map_mc._x / __config.map_width * 100, 2) + "%");
    } // End of the function
    function get zoom_y()
    {
        return (com.ammap.Utils.roundTo(__map_mc._y / __config.map_height * 100, 2) + "%");
    } // End of the function
    function get zoom_level()
    {
        return (__zoom_level + "%");
    } // End of the function
    function get mc()
    {
        return (__mc);
    } // End of the function
    function set data(data)
    {
        var _loc2 = __data.map_file;
        __data = data;
        if (__data.map_file == _loc2)
        {
            this.__resizeMap(__map_container_mc, true);
        }
        else
        {
            this.__init();
        } // end else if
        //return (this.data());
        null;
    } // End of the function
    function get mapInited()
    {
        return (__map_inited);
    } // End of the function
    function resize(width, height)
    {
        __config.width = width;
        __config.height = height;
        this.__resizeMap(__map_container_mc, true);
    } // End of the function
    var __bg_depth = 0;
    var __movies_depth = 500;
    var __labels_depth = 600;
    var __lines_depth = 700;
    var __map_depth = 100;
    var __preloader_depth = 1000;
    var __text_box_depth = 950;
    var __balloon_depth = 2000;
    var __zoom_tool_depth = 800;
    var __small_map_depth = 900;
    var __navigation_path_depth = 960;
    var __legend_depth = 970;
    var __object_list_depth = 980;
	var __developer_depth = 4000;
    var __zooming = false;
    var __zoom_level = 100;
    var __map_x = 0;
    var __map_y = 0;
	
	// tony
	function getMcXbyLong(_long)
	{
		return com.ammap.Utils.longitudeToPixels(__config.projection, _long, __data.tl_long, 
			__data.br_long, __config.map_width);
	} // End of the function
	function getMcYBYLat(_lat)
	{
		return com.ammap.Utils.latitudeToPixels(__config.projection, _lat, __data.tl_lat, 
			__data.br_lat, __config.map_height);
	} // End of the function
	function getXbyLong(_long)
	{
		return Math.round(getMcXbyLong(_long) * __zoom_level / 100  + __map_mc._x);
	} // End of the function
	function getYBYLat(_lat)
	{
		return Math.round(getMcYBYLat(_lat) * __zoom_level / 100 + __map_mc._y);
	} // End of the function
	// End of tony
} // End of Class
