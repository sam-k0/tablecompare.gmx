/// scr_saveTableInstances(filename)

var filename = argument0;

if(filename == "")
{
    show_message_async("Saving aborted.#"+scr_codeToStr(ERR_SAVEABORT))
}

var map = ds_map_create();
var cnt = 0;

for(var i = 0; i < instance_number(obj_block); i++)
{
    var inst = instance_find(obj_block, i);
    // starttime (date) , enddate (date) , yoffset (int) , image_yscale (int) , x, y
    var vmap = ds_map_create();
    
    vmap[?"yoffset"] = inst.yoffset;
    vmap[?"imgyscale"] = inst.image_yscale;
    vmap[?"xx"] = inst.x;
    vmap[?"yy"] = inst.y;
    
    vmap[?"title"] = inst.text;
    
    vmap[?"sdate_hour"] = date_get_hour(inst.starttime);
    vmap[?"sdate_minute"] = date_get_minute(inst.starttime);
    
    vmap[?"edate_hour"] = date_get_hour(inst.endtime);
    vmap[?"edate_minute"] = date_get_minute(inst.endtime);
    
    ds_map_add_map(map, string(cnt), vmap);
    
    cnt += 1;
}

map[?"count"] = string(cnt);

var jstring = json_encode(map);


// write to file

var file = file_text_open_write(filename);

file_text_write_string(file, jstring);

file_text_close(file);

// clear


for(var i = 0; i < cnt; i++)
{
    var vvmap = ds_map_find_value(map, string(i));
    ds_map_destroy(vvmap)
}

ds_map_destroy(map);


