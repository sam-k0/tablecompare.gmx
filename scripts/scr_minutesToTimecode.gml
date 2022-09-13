///scr_minutesToTimecode(minutes)

var minutes = argument0;
var fullhrs = minutes div 60;
var halfhrs = minutes mod 60;

if(fullhrs-8 < 1)
{
    return "";
}

var prefix = str(fullhrs - 8);
var postfix = "";

if(halfhrs == 30)
{
    postfix = "B";
}
else
{
    postfix = "A"
}

return prefix + postfix;
