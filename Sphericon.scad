function polygon_angles(order) = [ for (i = [0:order-1]) i*(360/order) - 90];

function polygon_points(order) = [ for (th=polygon_angles(order)) [cos(th), sin(th)] ];

function polygon_middle_angles(order) = [ for (i = [0:order-1]) (i + 0.5) *(360/order) - 90];

function polygon_middle_points(order) = [ for (th=polygon_middle_angles(order)) [cos(th), sin(th)] ];

function polygon_side_midpoints(order) = [ for (i=[0:order-1]) (polygon_points(order)[i] + polygon_points(order)[(i+1)%order]) / 2 ];

function polygon_side_length(order) = norm(polygon_points(order)[1] - polygon_points(order)[0]);

function polygon_arc_length(order) = 2 * 3.14159 / order;

module regular_polygon(order)
{
    polygon(polygon_points(order));
}

module half_sphericon(N)
{
    difference()
    {
        rotate_extrude() extruded_shape(N);
        translate([-2,0,-2]) cube([4,4,4]);
    }
}

module half_sphericon_shell(N)
{
    e = 1e-3;
    difference()
    {
        half_sphericon(N);
        translate([0,e,0]) scale(0.9) half_sphericon(N);
    }
}

module sphericon(N)
{
    union()
    {
        half_sphericon(N);
        rotate([0,360/N,180]) half_sphericon(N);
    }
}

module sphericon_shell(N)
{
    union()
    {
        half_sphericon_shell(N);
        rotate([0,360/N,180]) half_sphericon_shell(N);
    }
}
