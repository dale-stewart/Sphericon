// About how big do you want it to be, in millimeters?
scale = 50;

// How many sides should the polygon have?
sides = 10; // [4:32]

half_or_whole = "Half"; // ["Half", "Whole"]

// Do you want it hollow on the inside?
hollow = "No"; // ["No", "Yes"]

use <Sphericon.scad>

scale(scale/2)
{
    rotate([-90,0,0])
    if (hollow == "No")
    {
        if (half_or_whole == "Half")
            half_sphericon(sides);
        else
            sphericon(sides);
    }
    else
    {
        if (half_or_whole == "Half")
            half_sphericon_shell(sides);
        else
            sphericon_shell(sides);
    }
}
