/// scr_loadTableInstances(filename)

var filename = argument0;

if(!file_exists(filename))
{
    show_message_async("Could not find table " + filename)
    return 0;
}


var file = file_text_open_read(filename);
var jstring = "";
while (!file_text_eof(file))
{
    jstring += file_text_readln(file);
}
file_text_close(file);

var map = json_decode(jstring);

var cnt = int64(map[?"count"]);

show_debug_message(cnt)

for(var i = 0; i < cnt; i++)
{
    var inst = instance_create(200, 0, obj_block);
    var vmap = ds_map_find_value(map, string(i));
    
    show_debug_message(vmap[?"yoffset"])
    
    inst.yoffset = int64(vmap[?"yoffset"]);
    inst.image_yscalevmap = int64(vmap[?"imgyscale"]) ;
    
    
    inst.x = int64(vmap[?"xx"]);
    inst.y = int64(vmap[?"yy"]);
    
    inst.text = string(vmap[?"title"]);
    
    show_debug_message(vmap[?"xx"])
    
    inst.starttime = date_create_datetime(2022,0,0,int64(vmap[?"sdate_hour"]), int64(vmap[?"sdate_minute"]), 0);
    inst.endtime = date_create_datetime(2022,0,0,int64(vmap[?"edate_hour"]), int64(vmap[?"edate_minute"]), 0)
    
    with(inst)
    {
        var delta = date_minute_span(starttime, endtime);
        scr_resizeBlock(id, delta);
        show_debug_message("Delta; " + string(delta))
    }
    
    
    show_debug_message(i)
    ds_map_destroy(vmap);
}

ds_map_destroy(map);
