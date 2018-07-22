// About how big do you want it to be, in millimeters?
scale = 75;

// How many sides should the polygon have?
sides = 11; // [3:32]

// Do you want to see the shape of the polygon without the rotate extrustion?
polygon_only = "No"; // ["No", "Yes"]

// Do you want a whole sphericon, or half of one? (print two halves and glue them together)
half_or_whole = "Whole"; // ["Half", "Whole"]

// Do you want it hollow on the inside?
hollow = "No"; // ["No", "Yes"]

use <Sphericon.scad>

scale(scale/2)
{
    rotate([-90,0,0])
    if (polygon_only == "Yes")
    {
        regular_polygon(sides);
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
