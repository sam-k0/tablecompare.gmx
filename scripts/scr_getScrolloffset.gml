
if(instance_exists(obj_scrollcontroller))
{
return (abs(obj_scrollcontroller.scrolloffset) mod global.chunkpixelsize)
}
return 0;
