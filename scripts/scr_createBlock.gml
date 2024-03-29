/// scr_createBlock(bhoursstart, bminutesstart, bhoursend, bminutesend, title)

var last_block = noone;
// Create the block with given times
var totaltimemin = (argument0*60 + argument1);
var chunktime = global.chunksize; // min of one chunk
var chunkspawnsize = global.chunkpixelsize;
var chunks = totaltimemin div chunktime; // one chunk = 30 min
var rest = totaltimemin mod chunktime; // the rest
var yspawn = chunks * chunkspawnsize + (rest / chunktime)*chunkspawnsize;
var title = argument4;


last_block = instance_create(x - BLOCK_WIDTH/2, yspawn, obj_block);
last_block.starttime = date_create_datetime(2022,0,0,argument0, argument1, 0); // create date
last_block.endtime = date_create_datetime(2022,0,0,argument2, argument3, 0); // enddate
last_block.yoffset = yspawn; // used for scrolling
last_block.text = title;
var event_length = date_minute_span(last_block.starttime, last_block.endtime); // returns diff in minutes

// resize
scr_resizeBlock(last_block, event_length)
