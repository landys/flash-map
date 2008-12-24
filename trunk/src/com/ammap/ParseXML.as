class com.ammap.ParseXML
{
    var __config, __xml, __data, __parsed_xml, __get__obj;
    function ParseXML(xml, config)
    {
        __config = config;
        __xml = xml;
        this.__parseXML();
    } // End of the function
    function __parseXML()
    {
        __data = new Object();
        __parsed_xml = new com.ammap.XML2Object().parseXML(__xml).map;
        __data.map_file = __parsed_xml.attributes.map_file;
        __data.zoom_x = __parsed_xml.attributes.zoom_x;
        __data.zoom_y = __parsed_xml.attributes.zoom_y;
        __data.zoom = com.ammap.Utils.toNumber(com.ammap.Utils.stripSymbols(__parsed_xml.attributes.zoom, "%"));
        __data.parent = __data;
        __data.oid = __parsed_xml.attributes.oid;
        __data.url = __parsed_xml.attributes.url;
        __data.tl_long = com.ammap.Utils.toNumber(__parsed_xml.attributes.tl_long, -180);
        __data.tl_lat = com.ammap.Utils.toNumber(__parsed_xml.attributes.tl_lat, 90);
        __data.br_long = com.ammap.Utils.toNumber(__parsed_xml.attributes.br_long, 180);
        __data.br_lat = com.ammap.Utils.toNumber(__parsed_xml.attributes.br_lat, -90);
        __data.by_id = new Object();
        this.__parseAreas(__parsed_xml.areas.area, __data);
        this.__parseLabels(__parsed_xml.labels.label, __data);
        this.__parseLines(__parsed_xml.lines.line, __data);
        this.__parseMovies(__parsed_xml.movies.movie, __data);
    } // End of the function
    function __parseAreas(obj, pobj)
    {
        if (typeof(obj) == "object" && com.ammap.Utils.isArray(obj) == false)
        {
            obj = com.ammap.Utils.objectToArray(obj);
        } // end if
        pobj.areas = new Object();
        pobj.areas.area = new Array();
        var _loc7 = 0;
        for (var _loc4 = 0; _loc4 < obj.length; ++_loc4)
        {
            pobj.areas.area[_loc4] = new Object();
            pobj.areas.area[_loc4].type = "area";
            pobj.areas.area[_loc4].mc_name = obj[_loc4].attributes.mc_name;
            pobj.areas.area[_loc4].parent = pobj;
            pobj.areas.area[_loc4].oid = obj[_loc4].attributes.oid;
            pobj.areas.area[_loc4].link_with = obj[_loc4].attributes.link_with.split(",");
            pobj.areas.area[_loc4].color = com.ammap.Utils.toColor(obj[_loc4].attributes.color);
            pobj.areas.area[_loc4].color_hover = com.ammap.Utils.toColor(obj[_loc4].attributes.color_hover, __config.area.color_hover);
            pobj.areas.area[_loc4].alpha = com.ammap.Utils.toNumber(obj[_loc4].attributes.alpha, 100);
            pobj.areas.area[_loc4].title = com.ammap.Utils.checkUndefined(obj[_loc4].attributes.title, "");
            pobj.areas.area[_loc4].url = obj[_loc4].attributes.url;
            pobj.areas.area[_loc4].target = com.ammap.Utils.checkUndefined(obj[_loc4].attributes.target, "");
            pobj.areas.area[_loc4].description = com.ammap.Utils.checkUndefined(obj[_loc4].description.data, "");
            pobj.areas.area[_loc4].value = com.ammap.Utils.toNumber(obj[_loc4].attributes.value);
            pobj.areas.area[_loc4].zoom_x = obj[_loc4].attributes.zoom_x;
            pobj.areas.area[_loc4].zoom_y = obj[_loc4].attributes.zoom_y;
            pobj.areas.area[_loc4].zoom = com.ammap.Utils.toNumber(com.ammap.Utils.stripSymbols(obj[_loc4].attributes.zoom, "%"));
            pobj.areas.area[_loc4].text_box = com.ammap.Utils.parseTrue(obj[_loc4].attributes.text_box, __config.text_box.enabled);
            pobj.areas.area[_loc4].text_box_x = com.ammap.Utils.checkUndefined(obj[_loc4].attributes.text_box_x, __config.text_box.x);
            pobj.areas.area[_loc4].text_box_y = com.ammap.Utils.checkUndefined(obj[_loc4].attributes.text_box_y, __config.text_box.y);
            pobj.areas.area[_loc4].text_box_width = com.ammap.Utils.checkUndefined(obj[_loc4].attributes.text_box_width, __config.text_box.width);
            pobj.areas.area[_loc4].text_box_height = com.ammap.Utils.checkUndefined(obj[_loc4].attributes.text_box_height, __config.text_box.height);
            pobj.areas.area[_loc4].object_list = com.ammap.Utils.parseTrue(obj[_loc4].attributes.object_list, true);
            if (__config.area.active_only_if_value_set == true && isNaN(Number(pobj.areas.area[_loc4].value)) == true)
            {
                var _loc6 = false;
            }
            else
            {
                _loc6 = true;
            } // end else if
            pobj.areas.area[_loc4].balloon = com.ammap.Utils.parseTrue(obj[_loc4].attributes.balloon, _loc6);
            if (isNaN(pobj.areas.area[_loc4].value) == false)
            {
                _loc7 = _loc7 + pobj.areas.area[_loc4].value;
            } // end if
            __data.by_id[obj[_loc4].attributes.oid] = pobj.areas.area[_loc4];
            if (typeof(obj[_loc4].movies.movie) == "object")
            {
                this.__parseMovies(obj[_loc4].movies.movie, pobj.areas.area[_loc4]);
            } // end if
            if (typeof(obj[_loc4].labels.label) == "object")
            {
                this.__parseLabels(obj[_loc4].labels.label, pobj.areas.area[_loc4]);
            } // end if
            if (typeof(obj[_loc4].lines.line) == "object")
            {
                this.__parseLines(obj[_loc4].lines.line, pobj.areas.area[_loc4]);
            } // end if
        } // end of for
        var _loc5 = 0;
        for (var _loc4 = 0; _loc4 < pobj.areas.area.length; ++_loc4)
        {
            if (isNaN(pobj.areas.area[_loc4].value) == false)
            {
                pobj.areas.area[_loc4].percent = pobj.areas.area[_loc4].value / _loc7 * 100;
                if (pobj.areas.area[_loc4].percent > _loc5)
                {
                    _loc5 = pobj.areas.area[_loc4].percent;
                } // end if
                continue;
            } // end if
            pobj.areas.area[_loc4].percent = 0;
        } // end of for
        __config.max_percent = _loc5;
        for (var _loc4 = 0; _loc4 < pobj.areas.area.length; ++_loc4)
        {
            if (pobj.areas.area[_loc4].color == undefined)
            {
                pobj.areas.area[_loc4].color = com.ammap.Colors.getIntermediateColor(__config.area.color_light, __config.area.color_solid, pobj.areas.area[_loc4].percent / _loc5 * 100);
            } // end if
            pobj.areas.area[_loc4].color_selected = com.ammap.Utils.toColor(obj[_loc4].attributes.color_selected, com.ammap.Utils.checkUndefined(__config.area.color_selected, pobj.areas.area[_loc4].color));
        } // end of for
    } // End of the function
    function __parseLabels(obj, pobj)
    {
        if (typeof(obj) == "object" && com.ammap.Utils.isArray(obj) == false)
        {
            obj = com.ammap.Utils.objectToArray(obj);
        } // end if
        pobj.labels = new Object();
        pobj.labels.label = new Array();
        for (var _loc2 = 0; _loc2 < obj.length; ++_loc2)
        {
            pobj.labels.label[_loc2] = new Object();
            pobj.labels.label[_loc2].parent = pobj;
            pobj.labels.label[_loc2].type = "label";
            pobj.labels.label[_loc2].oid = obj[_loc2].attributes.oid;
            pobj.labels.label[_loc2].link_with = obj[_loc2].attributes.link_with.split(",");
            pobj.labels.label[_loc2].remain = com.ammap.Utils.parseTrue(obj[_loc2].attributes.remain, true);
            pobj.labels.label[_loc2].color = com.ammap.Utils.toColor(obj[_loc2].attributes.color, __config.text_color);
            pobj.labels.label[_loc2].bg_color = com.ammap.Utils.toColor(obj[_loc2].attributes.bg_color);
            pobj.labels.label[_loc2].bg_alpha = com.ammap.Utils.toNumber(obj[_loc2].attributes.bg_alpha, 100);
            pobj.labels.label[_loc2].color_hover = com.ammap.Utils.toColor(obj[_loc2].attributes.color_hover);
            pobj.labels.label[_loc2].url = obj[_loc2].attributes.url;
            pobj.labels.label[_loc2].target = com.ammap.Utils.checkUndefined(obj[_loc2].attributes.target, "");
            pobj.labels.label[_loc2].text = obj[_loc2].text.data;
            pobj.labels.label[_loc2].description = obj[_loc2].description.data;
            pobj.labels.label[_loc2].title = com.ammap.Utils.checkUndefined(obj[_loc2].attributes.title, "");
            pobj.labels.label[_loc2].x = obj[_loc2].attributes.x;
            pobj.labels.label[_loc2].y = obj[_loc2].attributes.y;
            pobj.labels.label[_loc2].long = obj[_loc2].attributes.long;
            pobj.labels.label[_loc2].lat = obj[_loc2].attributes.lat;
            pobj.labels.label[_loc2].zoom_x = obj[_loc2].attributes.zoom_x;
            pobj.labels.label[_loc2].zoom_y = obj[_loc2].attributes.zoom_y;
            pobj.labels.label[_loc2].zoom = com.ammap.Utils.toNumber(com.ammap.Utils.stripSymbols(obj[_loc2].attributes.zoom, "%"));
            pobj.labels.label[_loc2].width = com.ammap.Utils.getCoordinate(obj[_loc2].attributes.width, __config.width);
            pobj.labels.label[_loc2].align = obj[_loc2].attributes.align.toLowerCase();
            pobj.labels.label[_loc2].rotate = com.ammap.Utils.parseTrue(obj[_loc2].attributes.rotate);
            pobj.labels.label[_loc2].width = obj[_loc2].attributes.width;
            pobj.labels.label[_loc2].text_size = com.ammap.Utils.toNumber(obj[_loc2].attributes.text_size, __config.text_size);
            pobj.labels.label[_loc2].fixed_size = com.ammap.Utils.parseTrue(obj[_loc2].attributes.fixed_size, true);
            pobj.labels.label[_loc2].balloon = com.ammap.Utils.parseTrue(obj[_loc2].attributes.balloon, true);
            pobj.labels.label[_loc2].text_box = com.ammap.Utils.parseTrue(obj[_loc2].attributes.text_box, __config.text_box.enabled);
            pobj.labels.label[_loc2].text_box_x = com.ammap.Utils.checkUndefined(obj[_loc2].attributes.text_box_x, __config.text_box.x);
            pobj.labels.label[_loc2].text_box_y = com.ammap.Utils.checkUndefined(obj[_loc2].attributes.text_box_y, __config.text_box.y);
            pobj.labels.label[_loc2].text_box_width = com.ammap.Utils.checkUndefined(obj[_loc2].attributes.text_box_width, __config.text_box.width);
            pobj.labels.label[_loc2].text_box_height = com.ammap.Utils.checkUndefined(obj[_loc2].attributes.text_box_height, __config.text_box.height);
            pobj.labels.label[_loc2].object_list = com.ammap.Utils.parseTrue(obj[_loc2].attributes.object_list, true);
            __data.by_id[obj[_loc2].attributes.oid] = pobj.labels.label[_loc2];
            if (typeof(obj[_loc2].movies.movie) == "object")
            {
                this.__parseMovies(obj[_loc2].movies.movie, pobj.labels.label[_loc2]);
            } // end if
            if (typeof(obj[_loc2].labels.label) == "object")
            {
                this.__parseLabels(obj[_loc2].labels.label, pobj.labels.label[_loc2]);
            } // end if
            if (typeof(obj[_loc2].lines.line) == "object")
            {
                this.__parseLines(obj[_loc2].lines.line, pobj.labels.label[_loc2]);
            } // end if
        } // end of for
    } // End of the function
    function __parseLines(obj, pobj)
    {
        if (typeof(obj) == "object" && com.ammap.Utils.isArray(obj) == false)
        {
            obj = com.ammap.Utils.objectToArray(obj);
        } // end if
        pobj.lines = new Object();
        pobj.lines.line = new Array();
        for (var _loc2 = 0; _loc2 < obj.length; ++_loc2)
        {
            pobj.lines.line[_loc2] = new Object();
            pobj.lines.line[_loc2].remain = com.ammap.Utils.parseTrue(obj[_loc2].attributes.remain, true);
            pobj.lines.line[_loc2].x = com.ammap.Utils.stripSymbols(obj[_loc2].attributes.x, " ").split(",");
            pobj.lines.line[_loc2].y = com.ammap.Utils.stripSymbols(obj[_loc2].attributes.y, " ").split(",");
            pobj.lines.line[_loc2].long = com.ammap.Utils.stripSymbols(obj[_loc2].attributes.long, " ").split(",");
            pobj.lines.line[_loc2].lat = com.ammap.Utils.stripSymbols(obj[_loc2].attributes.lat, " ").split(",");
            pobj.lines.line[_loc2].width = com.ammap.Utils.toNumber(obj[_loc2].attributes.width, __config.line.width);
            pobj.lines.line[_loc2].alpha = com.ammap.Utils.toNumber(obj[_loc2].attributes.alpha, __config.line.alpha);
            pobj.lines.line[_loc2].color = com.ammap.Utils.toColor(obj[_loc2].attributes.color, __config.line.color);
            pobj.lines.line[_loc2].arrow = com.ammap.Utils.checkUndefined(obj[_loc2].attributes.arrow.toLowerCase(), __config.line.arrow);
            if (pobj.lines.line[_loc2].arrow != "end" && pobj.lines.line[_loc2].arrow != "middle" && pobj.lines.line[_loc2].arrow != "start" && pobj.lines.line[_loc2].arrow != "both")
            {
                pobj.lines.line[_loc2].arrow = undefined;
            } // end if
            pobj.lines.line[_loc2].dashed = com.ammap.Utils.parseTrue(obj[_loc2].attributes.dashed, __config.line.dashed);
            pobj.lines.line[_loc2].arrow_color = com.ammap.Utils.toColor(obj[_loc2].attributes.arrow_color, __config.line.arrow_color);
            pobj.lines.line[_loc2].arrow_alpha = com.ammap.Utils.toNumber(obj[_loc2].attributes.arrow_alpha, __config.line.arrow_alpha);
            pobj.lines.line[_loc2].arrow_size = com.ammap.Utils.toNumber(obj[_loc2].attributes.arrow_size, __config.line.arrow_size);
            pobj.lines.line[_loc2].fixed_size = com.ammap.Utils.parseTrue(obj[_loc2].attributes.fixed_size, __config.line.fixed_size);
            pobj.lines.line[_loc2].curved = com.ammap.Utils.parseTrue(obj[_loc2].attributes.curved, __config.line.curved);
        } // end of for
    } // End of the function
    function __parseMovies(obj, pobj)
    {
        if (typeof(obj) == "object" && com.ammap.Utils.isArray(obj) == false)
        {
            obj = com.ammap.Utils.objectToArray(obj);
        } // end if
        pobj.movies = new Object();
        pobj.movies.movie = new Array();
        var _loc6 = 0;
        for (var _loc2 = 0; _loc2 < obj.length; ++_loc2)
        {
            pobj.movies.movie[_loc2] = new Object();
            pobj.movies.movie[_loc2].parent = pobj;
            pobj.movies.movie[_loc2].oid = obj[_loc2].attributes.oid;
            pobj.movies.movie[_loc2].type = "movie";
            pobj.movies.movie[_loc2].link_with = obj[_loc2].attributes.link_with.split(",");
            pobj.movies.movie[_loc2].file = obj[_loc2].attributes.file;
            pobj.movies.movie[_loc2].flash_vars = obj[_loc2].attributes.flash_vars;
            pobj.movies.movie[_loc2].remain = com.ammap.Utils.parseTrue(obj[_loc2].attributes.remain, true);
            pobj.movies.movie[_loc2].color = com.ammap.Utils.toColor(obj[_loc2].attributes.color);
            pobj.movies.movie[_loc2].color_hover = com.ammap.Utils.toColor(obj[_loc2].attributes.color_hover);
            pobj.movies.movie[_loc2].color_selected = com.ammap.Utils.toColor(obj[_loc2].attributes.color_selected, com.ammap.Utils.checkUndefined(__config.movies.color_selected, pobj.movies.movie[_loc2].color));
            pobj.movies.movie[_loc2].alpha = com.ammap.Utils.toNumber(obj[_loc2].attributes.alpha, 100);
            pobj.movies.movie[_loc2].title = com.ammap.Utils.checkUndefined(obj[_loc2].attributes.title, "");
            pobj.movies.movie[_loc2].url = obj[_loc2].attributes.url;
            pobj.movies.movie[_loc2].target = com.ammap.Utils.checkUndefined(obj[_loc2].attributes.target, "");
            pobj.movies.movie[_loc2].description = com.ammap.Utils.checkUndefined(obj[_loc2].description.data, "");
            pobj.movies.movie[_loc2].value = com.ammap.Utils.toNumber(obj[_loc2].attributes.value);
            (pobj.movies.movie[_loc2].x = obj[_loc2].attributes.x);
            __config.width;
            (pobj.movies.movie[_loc2].y = obj[_loc2].attributes.y);
            __config.height;
            pobj.movies.movie[_loc2].zoom_x = obj[_loc2].attributes.zoom_x;
            pobj.movies.movie[_loc2].zoom_y = obj[_loc2].attributes.zoom_y;
            pobj.movies.movie[_loc2].zoom = com.ammap.Utils.toNumber(com.ammap.Utils.stripSymbols(obj[_loc2].attributes.zoom, "%"));
            pobj.movies.movie[_loc2].width = obj[_loc2].attributes.width;
            pobj.movies.movie[_loc2].height = obj[_loc2].attributes.height;
            pobj.movies.movie[_loc2].rotation = obj[_loc2].attributes.rotation;
            pobj.movies.movie[_loc2].long = obj[_loc2].attributes.long;
            pobj.movies.movie[_loc2].lat = obj[_loc2].attributes.lat;
            pobj.movies.movie[_loc2].center = com.ammap.Utils.parseTrue(obj[_loc2].attributes.center);
            pobj.movies.movie[_loc2].fixed_size = com.ammap.Utils.parseTrue(obj[_loc2].attributes.fixed_size, false);
            pobj.movies.movie[_loc2].text_box = com.ammap.Utils.parseTrue(obj[_loc2].attributes.text_box, __config.text_box.enabled);
            pobj.movies.movie[_loc2].text_box_x = com.ammap.Utils.checkUndefined(obj[_loc2].attributes.text_box_x, __config.text_box.x);
            pobj.movies.movie[_loc2].text_box_y = com.ammap.Utils.checkUndefined(obj[_loc2].attributes.text_box_y, __config.text_box.y);
            pobj.movies.movie[_loc2].text_box_width = com.ammap.Utils.checkUndefined(obj[_loc2].attributes.text_box_width, __config.text_box.width);
            pobj.movies.movie[_loc2].text_box_height = com.ammap.Utils.checkUndefined(obj[_loc2].attributes.text_box_height, __config.text_box.height);
            pobj.movies.movie[_loc2].object_list = com.ammap.Utils.parseTrue(obj[_loc2].attributes.object_list, true);
            if (__config.movie.show_balloon_if_value_set == true && isNaN(Number(pobj.movies.movie[_loc2].value)) == true)
            {
                var _loc5 = false;
            }
            else
            {
                _loc5 = true;
            } // end else if
            pobj.movies.movie[_loc2].balloon = com.ammap.Utils.parseTrue(obj[_loc2].attributes.balloon, _loc5);
            __data.by_id[obj[_loc2].attributes.oid] = pobj.movies.movie[_loc2];
            if (typeof(obj[_loc2].movies.movie) == "object")
            {
                this.__parseMovies(obj[_loc2].movies.movie, pobj.movies.movie[_loc2]);
            } // end if
            if (typeof(obj[_loc2].labels.label) == "object")
            {
                this.__parseLabels(obj[_loc2].labels.label, pobj.movies.movie[_loc2]);
            } // end if
            if (typeof(obj[_loc2].lines.line) == "object")
            {
                this.__parseLines(obj[_loc2].lines.line, pobj.movies.movie[_loc2]);
            } // end if
        } // end of for
    } // End of the function
    function get obj()
    {
        return (__data);
    } // End of the function
} // End of Class
