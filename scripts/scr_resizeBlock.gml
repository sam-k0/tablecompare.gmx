/// scr_resizeBlock(id, minutes)

var imgh = sprite_get_height(spr_block);
var inst = argument0;
var minutes = argument1;


var chunktime = global.chunksize; // min of one chunk
var chunkspawnsize = global.chunkpixelsize; // aka, 30 minutes = 64 pixels

var chunks = minutes div chunktime; // one chunk = 30 min
var rest = minutes mod chunktime; // the rest
var pixelamount = chunks * chunkspawnsize + (rest / chunktime)*chunkspawnsize;

inst.image_yscale = imgh*pixelamount;
