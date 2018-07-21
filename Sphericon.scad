function polygon_angles(order) = [ for (i = [0:order-1]) i*(360/order) - (order % 2) * (-90/order)];

function polygon_points(order) = [ for (th=polygon_angles(order)) [cos(th), sin(th)] ];

module regular_polygon(order)
{
    polygon(polygon_points(order));
}

module shape(N)
{
    difference()
    {
        regular_polygon(N);
        translate([-1, 0]) square([2,4], center=true);
    }
}

module half_sphericon(N)
{
    difference()
    {
        rotate_extrude($fn=360) shape(N);
        translate([-1,0,-1]) cube([2,2,2]);
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
