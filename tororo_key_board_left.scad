use <key_switch.scad>

w = 19.05; // unit width

padding_x_l = 4; // padding x left 
padding_x_r = 4; // padding x right
padding_y_t = 4; // padding y top
padding_y_b = 4; // padding y bottom

y1 = 0;      // row1
y2 = -w;     // row2
y3 = -2 * w; // row3
y4 = -3 * w; // row4
y5 = -4 * w; // row5

difference() {    
    base_top_plate();
    key_switches();
    unit_cube(7 * w + padding_x_r, y1 + w);
    unit_cube(7 * w + padding_x_r, y1);
    unit_cube((1.5 + 5) * w + padding_x_r, y2);
    unit_cube((1.75 + 5) * w + padding_x_r, y3);
}

module base_top_plate() {
    plate_w_x = padding_x_l + w / 2 + 6.75 * w + padding_x_r;
    plate_w_y = padding_y_t + w / 2 + 4.5 * w + padding_y_b;
    plate_h = 4;

    translate([-w / 2 - padding_x_l, -plate_w_y + padding_y_t + w / 2, -plate_h]) {
        cube([plate_w_x, plate_w_y, plate_h], center = false);
    }
}

module key_switches() {
    // row 1
    for (i = [0:6]) {
        key_switch(i * w, y1);
    }

    // row 2
    key_switch(0.25 * w, y2);
    for (i = [0:4]) {
        key_switch((1.5 + i) * w, y2);
    }

    // row 3
    key_switch(0.375 * w, y3);
    for (i = [0:4]) {
        key_switch((1.75 + i) * w, y3);
    }

    // row 4
    key_switch(0.625 * w, y4);
    for (i = [0:4]) {
        key_switch((2.25 + i) * w, y4);
    }
    
    // row 5

    key_switch(1.5 * w, y5);
    key_switch(2.75 * w, y5);
    key_switch(4 * w, y5);
    key_switch(5.625 * w, y5);
}

module unit_cube(x, y) {
    translate([x, y, 0]) {
        cube([w, w, w], center = true);
    }
}