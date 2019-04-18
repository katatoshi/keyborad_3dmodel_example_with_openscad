key_switch(0, 0);

module key_switch(x, y) {
    union() {
        h1 = 2;
        translate([x, y, h1 / 2]) {
            cube([16, 16, h1], center=true);
        }
        h2 = 5;
        translate([x, y, h1 + h2 / 2]) {
            cube([16, 16, h2], center=true);
        }
        h3 = 1.2;
        translate([x, y, -h3 / 2]) {
            cube([14, 14, h3], center=true);
        }
        h4 = 1.5;
        translate([x, y, -h3 - h4 / 2]) {
            cube([14, 16, h4], center=true);
        }
        h5 = 10;
        translate([x, y, -h3 - h4 - h5 / 2]) {
            cube([14, 14, h5], center=true);
        }
        key_cap(x, y);
    }
}

module key_cap(x, y) {
    wx1 = 18;
    dx1 = wx1 / 2;

    wy1 = 18;
    dy1 = wy1 / 2;

    wx2 = 12;
    dx2 = wx2 / 2;

    wy2 = 13;
    ry2 = 0.6; // should be greater than 0.5

    z1 = 7;

    z2 = z1 + 10;

    points = [
    [x + dx1, y + dy1, z1], // 0
    [x + dx1, y - dy1, z1], // 1
    [x - dx1, y + dy1, z1], // 2
    [x - dx1, y - dy1, z1], // 3
    [x + dx2, y + ry2 * wy2, z2], // 4
    [x + dx2, y - (1 - ry2) * wy2, z2], // 5
    [x - dx2, y + ry2 * wy2, z2], // 6
    [x - dx2, y - (1 - ry2) * wy2, z2] // 7
    ];
    
    // "All faces must have points ordered in the same direction . OpenSCAD prefers clockwise when looking at each face from outside inwards (from OpenSCAD User Manual/Primitive Solids)"
    faces = [
        [0, 2, 3, 1], // bottom
        [0, 1, 5, 4], // right
        [1, 3, 7, 5], // front
        [3, 2, 6, 7], // left
        [2, 0, 4, 6], // back
        [4, 5, 7, 6]  // top
    ];
    
    polyhedron(points, faces);
}