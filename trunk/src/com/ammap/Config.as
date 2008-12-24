class com.ammap.Config
{
    var __settings, __config, __get__obj;
    function Config(settings)
    {
        __settings = settings;
        __config = new Object();
        this.__parseSettings();
    } // End of the function
    function __parseSettings()
    {
        __config.developer_mode = com.ammap.Utils.parseTrue(__settings.developer_mode.data, false);
        __config.projection = com.ammap.Utils.checkUndefined(__settings.projection.data.toLowerCase(), "xy");
        __config.width = com.ammap.Utils.toNumber(__settings.width.data);
        __config.height = com.ammap.Utils.toNumber(__settings.height.data);
        __config.font = com.ammap.Utils.checkUndefined(__settings.font.data, "Tahoma");
        _global.font = __config.font;
        __config.text_size = com.ammap.Utils.toNumber(__settings.text_size.data, 11);
        __config.text_color = com.ammap.Utils.toColor(__settings.text_color.data, 0);
        __config.reload_data_interval = com.ammap.Utils.toNumber(__settings.reload_data_interval.data, 0);
        __config.add_time_stamp = com.ammap.Utils.parseTrue(__settings.add_time_stamp.data, false);
        __config.decimals_separator = com.ammap.Utils.checkUndefined(__settings.decimals_separator.data, ",");
        __config.thousands_separator = com.ammap.Utils.checkUndefined(__settings.thousands_separator.data, " ");
        if (__config.thousands_separator == "none")
        {
            __config.thousands_separator = "";
        } // end if
        __config.redraw = com.ammap.Utils.parseTrue(__settings.redraw.data, false);
        __config.precision = Math.abs(com.ammap.Utils.toNumber(__settings.precision.data, 2));
        __config.export_image_file = __settings.export_image_file.data;
        __config.color_change_time_start = com.ammap.Utils.toNumber(__settings.color_change_time_start.data, 2);
        __config.color_change_time_hover = com.ammap.Utils.toNumber(__settings.color_change_time_hover.data, 2.000000E-001);
        __config.fit_to_screen = com.ammap.Utils.parseTrue(__settings.fit_to_screen.data, true);
        __config.drag_map = com.ammap.Utils.parseTrue(__settings.drag_map.data, true);
        __config.strings = new Object();
        __config.strings.loading_map = com.ammap.Utils.checkUndefined(__settings.strings.loading_map.data, "Loading map");
        __config.strings.export_as_image = com.ammap.Utils.checkUndefined(__settings.strings.export_as_image.data, "Export as image");
        __config.strings.collecting_data = com.ammap.Utils.checkUndefined(__settings.strings.collecting_data.data, "Collecting data");
        __config.area = new Object();
        __config.area.color_solid = com.ammap.Utils.toColor(__settings.area.color_solid.data, 10027008);
        __config.area.color_light = com.ammap.Utils.toColor(__settings.area.color_light.data, 16763904);
        __config.area.color_hover = com.ammap.Utils.toColor(__settings.area.color_hover.data);
        __config.area.color_selected = com.ammap.Utils.toColor(__settings.area.color_selected.data);
        __config.area.balloon_text = __settings.area.balloon_text.data;
        __config.area.active_only_if_value_set = com.ammap.Utils.parseTrue(__settings.area.active_only_if_value_set.data, false);
        __config.area.disable_when_clicked = com.ammap.Utils.parseTrue(__settings.area.disable_when_clicked.data, false);
        __config.movie = new Object();
        __config.movie.balloon_text = __settings.movie.balloon_text.data;
        __config.movie.active_only_if_value_set = com.ammap.Utils.parseTrue(__settings.movie.active_only_if_value_set.data, false);
        __config.movie.disable_when_clicked = com.ammap.Utils.parseTrue(__settings.movie.disable_when_clicked.data, false);
        __config.label = new Object();
        __config.label.balloon_text = __settings.label.balloon_text.data;
        __config.label.bg_margins_vertical = com.ammap.Utils.toNumber(__settings.label.bg_margins_vertical.data, 10);
        __config.label.bg_margins_horizontal = com.ammap.Utils.toNumber(__settings.label.bg_margins_horizontal.data, 10);
        __config.line = new Object();
        __config.line.color = com.ammap.Utils.toColor(__settings.line.color.data, 10027008);
        __config.line.alpha = com.ammap.Utils.toNumber(__settings.line.alpha.data, 100);
        __config.line.width = com.ammap.Utils.toNumber(__settings.line.width.data, 0);
        __config.line.arrow = __settings.line.arrow.data.toLowerCase();
        __config.line.arrow_alpha = com.ammap.Utils.toNumber(__settings.line.arrow_alpha.data, 100);
        __config.line.arrow_size = com.ammap.Utils.toNumber(__settings.line.arrow_size.data, 8);
        __config.line.arrow_color = com.ammap.Utils.toColor(__settings.line.arrow_color.data, __config.line.color);
        __config.line.dashed = com.ammap.Utils.parseTrue(__settings.line.dashed.data, false);
        __config.line.fixed_size = com.ammap.Utils.parseTrue(__settings.line.dashed.fixed_size, true);
        __config.line.curved = com.ammap.Utils.parseTrue(__settings.line.curved.data, false);
        __config.balloon = new Object();
        __config.balloon.enabled = com.ammap.Utils.parseTrue(__settings.balloon.enabled.data, true);
        __config.balloon.color = com.ammap.Utils.toColor(__settings.balloon.color.data, 8912896);
        __config.balloon.alpha = com.ammap.Utils.toNumber(__settings.balloon.alpha.data, 100);
        __config.balloon.max_width = com.ammap.Utils.checkUndefined(__settings.balloon.max_width.data, "30%");
        __config.balloon.text_color = com.ammap.Utils.toColor(__settings.balloon.text_color.data, 16777215);
        __config.balloon.text_size = com.ammap.Utils.toNumber(__settings.balloon.text_size.data, __config.text_size);
        __config.balloon.arrow = com.ammap.Utils.checkUndefined(__settings.balloon.arrow.data, "vertical");
        __config.balloon.border_color = com.ammap.Utils.toColor(__settings.balloon.border_color.data, __config.balloon.color);
        __config.balloon.border_alpha = com.ammap.Utils.toNumber(__settings.balloon.border_alpha.data, __config.balloon.alpha);
        __config.balloon.border_width = com.ammap.Utils.toNumber(__settings.balloon.border_width.data, 0);
        __config.balloon.corner_radius = com.ammap.Utils.toNumber(__settings.balloon.corner_radius.data, 0);
        __config.background = new Object();
        __config.background.color = com.ammap.Utils.toColor(__settings.background.color.data, 4473924);
        __config.background.alpha = com.ammap.Utils.toNumber(__settings.background.alpha.data, 0);
        __config.background.file = __settings.background.file.data;
        __config.background.border_color = com.ammap.Utils.toColor(__settings.background.border_color.data, 0);
        __config.background.border_alpha = com.ammap.Utils.toNumber(__settings.background.border_alpha.data, 0);
        __config.zoom = new Object();
        __config.zoom.enabled = com.ammap.Utils.parseTrue(__settings.zoom.enabled.data, true);
        __config.zoom.locked = com.ammap.Utils.parseTrue(__settings.zoom.locked.data, false);
        __config.zoom.arrows_enabled = com.ammap.Utils.parseTrue(__settings.zoom.arrows_enabled.data, true);
        __config.zoom.mouse_wheel_enabled = com.ammap.Utils.parseTrue(__settings.zoom.mouse_wheel_enabled.data, true);
        __config.zoom.home_link_enabled = com.ammap.Utils.parseTrue(__settings.zoom.home_link_enabled.data, true);
        __config.zoom.step_size = com.ammap.Utils.toNumber(__settings.zoom.step_size.data, 10);
        __config.zoom.color = com.ammap.Utils.toColor(__settings.zoom.color.data, 10027008);
        __config.zoom.alpha = com.ammap.Utils.toNumber(__settings.zoom.alpha.data, 100);
        __config.zoom.color_hover = com.ammap.Utils.toColor(__settings.zoom.color_hover.data, 13369344);
        __config.zoom.outline_color = com.ammap.Utils.toColor(__settings.zoom.outline_color.data, 16777215);
        __config.zoom.outline_alpha = com.ammap.Utils.toNumber(__settings.zoom.outline_alpha.data, 100);
        __config.zoom.x = com.ammap.Utils.checkUndefined(__settings.zoom.x.data, 15);
        __config.zoom.y = com.ammap.Utils.checkUndefined(__settings.zoom.y.data, 22);
        __config.zoom.height = com.ammap.Utils.checkUndefined(__settings.zoom.height.data, 200);
        __config.zoom.min = com.ammap.Utils.toNumber(com.ammap.Utils.stripSymbols(__settings.zoom.min.data, "%"));
        __config.zoom.max = com.ammap.Utils.toNumber(com.ammap.Utils.stripSymbols(__settings.zoom.max.data, "%"), 2000);
        __config.zoom.grid_every = com.ammap.Utils.toNumber(com.ammap.Utils.stripSymbols(__settings.zoom.grid_every.data, "%"), 100);
        __config.zoom.time = com.ammap.Utils.toNumber(__settings.zoom.time.data, 1);
        __config.zoom.effect = com.ammap.Utils.checkUndefined(__settings.zoom.effect.data.toLowerCase(), "easeout");
        __config.zoom.rotate = com.ammap.Utils.parseTrue(__settings.zoom.rotate.data, false);
        __config.zoom.background_zooms_to_top = com.ammap.Utils.parseTrue(__settings.zoom.background_zooms_to_top.data, false);
        __config.small_map = new Object();
        __config.small_map.enabled = com.ammap.Utils.parseTrue(__settings.small_map.enabled.data, true);
        __config.small_map.locked = com.ammap.Utils.parseTrue(__settings.small_map.locked.data, false);
        __config.small_map.active = com.ammap.Utils.parseTrue(__settings.small_map.active.data, true);
        __config.small_map.x = __settings.small_map.x.data;
        __config.small_map.y = __settings.small_map.y.data;
        __config.small_map.width = com.ammap.Utils.checkUndefined(__settings.small_map.width.data, "25%");
        __config.small_map.color = com.ammap.Utils.toColor(__settings.small_map.color.data);
        __config.small_map.border_width = com.ammap.Utils.toNumber(__settings.small_map.border_width.data, 5);
        __config.small_map.border_color = com.ammap.Utils.toColor(__settings.small_map.border_color.data, 16777215);
        __config.small_map.rectangle_color = com.ammap.Utils.toColor(__settings.small_map.rectangle_color.data, 16777215);
        __config.small_map.collapse_button_color = com.ammap.Utils.toColor(__settings.small_map.collapse_button_color.data, 0);
        __config.small_map.collapse_button_position = com.ammap.Utils.checkUndefined(__settings.small_map.collapse_button_position.data.toLowerCase(), "br");
        __config.navigation_path = new Object();
        __config.navigation_path.enabled = com.ammap.Utils.parseTrue(__settings.navigation_path.enabled.data, false);
        __config.navigation_path.x = com.ammap.Utils.checkUndefined(__settings.navigation_path.x.data, 70);
        __config.navigation_path.y = com.ammap.Utils.checkUndefined(__settings.navigation_path.y.data, 36);
        __config.navigation_path.color = com.ammap.Utils.toColor(__settings.navigation_path.color.data, 0);
        __config.navigation_path.alpha = com.ammap.Utils.toNumber(__settings.navigation_path.alpha.data, 0);
        __config.navigation_path.padding = com.ammap.Utils.toNumber(__settings.navigation_path.padding.data, 0);
        __config.navigation_path.text_size = com.ammap.Utils.toNumber(__settings.navigation_path.text_size.data, __config.text_size);
        __config.navigation_path.text_color = com.ammap.Utils.toColor(__settings.navigation_path.text_color.data, 16777215);
        __config.navigation_path.text_color_hover = com.ammap.Utils.toColor(__settings.navigation_path.text_color_hover.data, 13369344);
        __config.navigation_path.separator = com.ammap.Utils.checkUndefined(__settings.navigation_path.separator.data, "");
        __config.navigation_path.home_text = com.ammap.Utils.checkUndefined(__settings.navigation_path.home_text.data, "");
        __config.export_as_image = new Object();
        __config.export_as_image.file = com.ammap.Utils.checkUndefined(__settings.export_as_image.file.data, __config.export_image_file);
        __config.export_as_image.target = com.ammap.Utils.checkUndefined(__settings.export_as_image.target.data, "");
        __config.export_as_image.x = com.ammap.Utils.toNumber(__settings.export_as_image.x.data);
        __config.export_as_image.y = com.ammap.Utils.toNumber(__settings.export_as_image.y.data);
        __config.export_as_image.color = com.ammap.Utils.toColor(__settings.export_as_image.color.data, 12303104);
        __config.export_as_image.alpha = com.ammap.Utils.toNumber(__settings.export_as_image.alpha.data, 0);
        __config.export_as_image.text_color = com.ammap.Utils.toColor(__settings.export_as_image.text_color.data, __config.text_color);
        __config.export_as_image.text_size = com.ammap.Utils.toNumber(__settings.export_as_image.text_size.data, __config.text_size);
        __config.legend = new Object();
        __config.legend.enabled = com.ammap.Utils.parseTrue(__settings.legend.enabled.data, true);
        __config.legend.x = com.ammap.Utils.checkUndefined(__settings.legend.x.data, 20);
        __config.legend.y = com.ammap.Utils.checkUndefined(__settings.legend.y.data, "!55");
        __config.legend.width = __settings.legend.width.data;
        __config.legend.max_columns = com.ammap.Utils.toNumber(__settings.legend.max_columns.data, 0);
        __config.legend.color = com.ammap.Utils.toColor(__settings.legend.color.data, 16777215);
        __config.legend.alpha = com.ammap.Utils.toNumber(__settings.legend.alpha.data, 50);
        __config.legend.border_color = com.ammap.Utils.toColor(__settings.legend.border_color.data, 0);
        __config.legend.border_alpha = com.ammap.Utils.toNumber(__settings.legend.border_alpha.data, 30);
        __config.legend.key = new Object();
        __config.legend.key.size = com.ammap.Utils.toNumber(__settings.legend.key.size.data, 16);
        __config.legend.key.border_color = com.ammap.Utils.toColor(__settings.legend.key.border_color.data);
        __config.legend.text_color = com.ammap.Utils.toColor(__settings.legend.text_color.data, __config.text_color);
        __config.legend.text_size = com.ammap.Utils.toNumber(__settings.legend.text_size.data, __config.text_size);
        __config.legend.spacing = com.ammap.Utils.toNumber(__settings.legend.spacing.data, 10);
        __config.legend.margins = com.ammap.Utils.toNumber(__settings.legend.margins.data, 10);
        __config.legend.entries = new Object();
        __config.legend.entries.entry = new Array();
        __settings.legend.entries.entry = com.ammap.Utils.objectToArray(__settings.legend.entries.entry);
        for (var _loc3 = 0; _loc3 < __settings.legend.entries.entry.length; ++_loc3)
        {
            __config.legend.entries.entry[_loc3] = new Object();
            __config.legend.entries.entry[_loc3].color = com.ammap.Utils.toColor(__settings.legend.entries.entry[_loc3].attributes.color);
            __config.legend.entries.entry[_loc3].title = __settings.legend.entries.entry[_loc3].data;
        } // end of for
        __config.text_box = new Object();
        __config.text_box.enabled = com.ammap.Utils.parseTrue(__settings.text_box.enabled.data, true);
        __config.text_box.locked = com.ammap.Utils.parseTrue(__settings.text_box.locked.data, false);
        __config.text_box.show_on_hover = com.ammap.Utils.parseTrue(__settings.text_box.show_on_hover.data, false);
        __config.text_box.hide_on_roll_out = com.ammap.Utils.parseTrue(__settings.text_box.hide_on_roll_out.data, false);
        __config.text_box.color = com.ammap.Utils.toColor(__settings.text_box.color.data, 16777215);
        __config.text_box.alpha = com.ammap.Utils.toNumber(__settings.text_box.alpha.data, 100);
        __config.text_box.x = com.ammap.Utils.checkUndefined(__settings.text_box.x.data, "60%");
        __config.text_box.y = com.ammap.Utils.checkUndefined(__settings.text_box.y.data, "20%");
        __config.text_box.height = com.ammap.Utils.checkUndefined(__settings.text_box.height.data, "50%");
        __config.text_box.width = com.ammap.Utils.checkUndefined(__settings.text_box.width.data, "35%");
        __config.text_box.corner_radius = com.ammap.Utils.toNumber(__settings.text_box.corner_radius.data, 0);
        __config.text_box.border_width = com.ammap.Utils.toNumber(__settings.text_box.border_width.data, 0);
        __config.text_box.border_color = com.ammap.Utils.toColor(__settings.text_box.border_color.data, 14342874);
        __config.text_box.border_alpha = com.ammap.Utils.toNumber(__settings.text_box.border_alpha.data, 100);
        __config.text_box.margin_width = com.ammap.Utils.toNumber(__settings.text_box.margin_width.data, 10);
        __config.text_box.text_size = com.ammap.Utils.toNumber(__settings.text_box.text_size.data, __config.text_size);
        __config.text_box.text_color = com.ammap.Utils.toColor(__settings.text_box.text_color.data, __config.text_color);
        __config.text_box.scroller_color = com.ammap.Utils.toColor(__settings.text_box.scroller_color.data, 10027008);
        __config.text_box.scroller_bg_color = com.ammap.Utils.toColor(__settings.text_box.scroller_bg_color.data, 14342874);
        __config.text_box.shadow_alpha = com.ammap.Utils.toNumber(__settings.text_box.shadow_alpha.data, 50);
        __config.text_box.shadow_blur = com.ammap.Utils.toNumber(__settings.text_box.shadow_blur.data, 5);
        __config.text_box.shadow_distance = com.ammap.Utils.toNumber(__settings.text_box.shadow_distance.data, 5);
        __config.text_box.shadow_color = com.ammap.Utils.toColor(__settings.text_box.shadow_color.data, 0);
        __config.text_box.close_button_color = com.ammap.Utils.toColor(__settings.text_box.close_button_color.data, 0);
        __config.text_box.close_button_color_hover = com.ammap.Utils.toColor(__settings.text_box.close_button_color_hover.data, 13369344);
        __config.object_list = new Object();
        __config.object_list.type = com.ammap.Utils.checkUndefined(__settings.object_list.type.data, "dropdown");
        __config.object_list.enabled = com.ammap.Utils.parseTrue(__settings.object_list.enabled.data, false);
        __config.object_list.color = com.ammap.Utils.toColor(__settings.object_list.color.data, 16777215);
        __config.object_list.alpha = com.ammap.Utils.toNumber(__settings.object_list.alpha.data, 100);
        __config.object_list.x = com.ammap.Utils.checkUndefined(__settings.object_list.x.data, "!200");
        __config.object_list.y = com.ammap.Utils.checkUndefined(__settings.object_list.y.data, "0");
        __config.object_list.height = com.ammap.Utils.checkUndefined(__settings.object_list.height.data, "100%");
        __config.object_list.width = com.ammap.Utils.checkUndefined(__settings.object_list.width.data, 200);
        __config.object_list.border_color = com.ammap.Utils.toColor(__settings.object_list.border_color.data, 14342874);
        __config.object_list.border_alpha = com.ammap.Utils.toNumber(__settings.object_list.border_alpha.data, 100);
        __config.object_list.text_size = com.ammap.Utils.toNumber(__settings.object_list.text_size.data, __config.text_size);
        __config.object_list.text_color = com.ammap.Utils.toColor(__settings.object_list.text_color.data, __config.text_color);
        __config.object_list.scroller_color = com.ammap.Utils.toColor(__settings.object_list.scroller_color.data, 10027008);
        __config.object_list.scroller_bg_color = com.ammap.Utils.toColor(__settings.object_list.scroller_bg_color.data, 14342874);
        __config.object_list.bg_color_hover = com.ammap.Utils.toColor(__settings.object_list.bg_color_hover.data, 14342874);
        __config.object_list.bg_color_selected = com.ammap.Utils.toColor(__settings.object_list.bg_color_selected.data, 0);
        __config.object_list.text_color_hover = com.ammap.Utils.toColor(__settings.object_list.text_color_hover.data, 0);
        __config.object_list.text_color_selected = com.ammap.Utils.toColor(__settings.object_list.text_color_selected.data, 16777215);
        __config.object_list.levels = com.ammap.Utils.toNumber(__settings.object_list.levels.data, 3);
        __config.object_list.include_areas = com.ammap.Utils.parseTrue(__settings.object_list.include_areas.data, true);
        __config.object_list.include_movies = com.ammap.Utils.parseTrue(__settings.object_list.include_movies.data, true);
        __config.object_list.include_labels = com.ammap.Utils.parseTrue(__settings.object_list.include_labels.data, true);
        __config.object_list.home_text = com.ammap.Utils.checkUndefined(__settings.object_list.home_text.data, "Home");
        if (typeof(__settings.context_menu.menu) == "object" && com.ammap.Utils.isArray(__settings.context_menu.menu) == false)
        {
            __settings.context_menu.menu = com.ammap.Utils.objectToArray(__settings.context_menu.menu);
        } // end if
        __config.context_menu = new Object();
        __config.context_menu.menu = new Array();
        for (var _loc4 = 0; _loc4 < __settings.context_menu.menu.length; ++_loc4)
        {
            __config.context_menu.menu[_loc4] = new Object();
            __config.context_menu.menu[_loc4].title = __settings.context_menu.menu[_loc4].attributes.title;
            __config.context_menu.menu[_loc4].function_name = __settings.context_menu.menu[_loc4].attributes.function_name;
        } // end of for
    } // End of the function
    function get obj()
    {
        return (__config);
    } // End of the function
} // End of Class
