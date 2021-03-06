// About how big do you want it to be, in millimeters?
scale = 50;

// How many sides should the polygon have?
sides = 4; // [3:32]

// Do you want to see the shape of the polygon without the rotate extrustion?
polygon_only = "No"; // ["No", "Yes"]

// Do you want to see the shape of the polygon cut in half?
half_polygon_only = "No"; // ["No", "Yes"]

// Do you want a whole sphericon, or half of one? (print two halves and glue them together)
half_or_whole = "Half"; // ["Half", "Whole"]

// Do you want it hollow on the inside?
hollow = "No"; // ["No", "Yes"]

// How smooth should it be? (More faces is smoother)
faces = 90; // [10:360]

// Do you want a continuous face or edge (for even numbers of sides only)
continuous = "Face"; // ["Face", "Edge"]

// Do you want a bulbous appearance?
bulbous = "No"; // ["No", "Yes"]

module modified_polygon(N)
{
    if (bulbous == "Yes")
        bulbous_polygon(N);
    else
        regular_polygon(N);
}

module extruded_shape(N)
{
    difference()
    {
        if (continuous == "Face")
            modified_polygon(N);
        else
            rotate(180/N) modified_polygon(N);

        translate([-1, 0]) square([2,4], center=true);
    }
}

include <Sphericon.scad>

$fn=faces;

scale(scale/2)
{
    rotate([-90,0,0])
    if (polygon_only == "Yes")
    {
        if (half_polygon_only == "Yes")
            extruded_shape(sides);
        else
            modified_polygon(sides);
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
