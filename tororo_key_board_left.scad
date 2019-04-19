w = 19.05;

difference() {    
    set_plate();
    set_key_switches();
}

module set_plate() {
    plate_w_x = 4 + w / 2 + 6.75 * w + 4;
    plate_w_y = 4 + w / 2 + 4.5 * w + 4;
    plate_h = 4;

    translate([-w / 2 - 4, -plate_w_y + 4 + w / 2, -plate_h]) {
        cube([plate_w_x, plate_w_y, plate_h], center = false);
    }
}

module set_key_switches() {
    // row 1
    y1 = 0;
    for (i = [0:6]) {
        key_switch(i * w, y1);
    }

    // row 2
    y2 = -w;
    key_switch(0.25 * w, y2);
    for (i = [0:4]) {
        key_switch((1.5 + i) * w, y2);
    }

    // row 3
    y3 = -2 * w;
    key_switch(0.375 * w, y3);
    for (i = [0:4]) {
        key_switch((1.75 + i) * w, y3);
    }

    // row 4
    y4 = -3 * w;
    key_switch(0.625 * w, y4);
    for (i = [0:4]) {
        key_switch((2.25 + i) * w, y4);
    }
    
    // row 5
    y5 = -4 * w;
    key_switch(1.5 * w, y5);
    key_switch(2.75 * w, y5);
    key_switch(4 * w, y5);
    key_switch(5.625 * w, y5);
}

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