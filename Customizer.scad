// About how big do you want it to be, in millimeters?
scale = 100;

// How many sides should the polygon have?
sides = 10; // [4:32]

// Do you want to see the shape of the polygon without the rotate extrustion?
shape_only = "No"; // ["No", "Yes"]

half_or_whole = "Whole"; // ["Half", "Whole"]

// Do you want it hollow on the inside?
hollow = "No"; // ["No", "Yes"]

use <Sphericon.scad>

scale(scale/2)
{
    rotate([-90,0,0])
    if (shape_only == "Yes")
    {
        shape(sides);
    }
    else if (hollow == "No")
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
