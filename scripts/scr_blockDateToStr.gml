
var __date = argument0;
var __str =  str(date_get_hour(__date)) + ":" + str(date_get_minute(__date));

if(date_get_minute(__date) == 0)
{
    __str += "0";
}

return __str;
