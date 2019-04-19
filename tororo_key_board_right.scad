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
    unit_cube(-8 * w - padding_x_l, y1 + w);
    unit_cube(-8 * w - padding_x_l, y1);
    unit_cube(-(2.25 + 6) * w - padding_x_l, y3);
    unit_cube(-(2.75 + 5) * w - padding_x_l, y4);
    unit_cube(-(2.75 + 5) * w -padding_x_l, y5);
    unit_cube(-(2.75 + 5) * w -padding_x_l, y5 - w);
}

module base_top_plate() {
    plate_w_x = padding_x_l + w / 2 + 8 * w + padding_x_r;
    plate_w_y = padding_y_t + w / 2 + 4.5 * w + padding_y_b;
    plate_h = 4;

    translate([-plate_w_x + w / 2 + padding_x_r, -plate_w_y + padding_y_t + w / 2, -plate_h]) {
        cube([plate_w_x, plate_w_y, plate_h], center = false);
    }
}

module key_switches() {
    // row 1
    y1 = 0;
    for (i = [0:7]) {
        key_switch(-i * w, y1);
    }

    // row 2
    y2 = -w;
    key_switch(-0.25 * w, y2);
    for (i = [0:6]) {
        key_switch(-(1.5 + i) * w, y2);
    }

    // row 3
    y3 = -2 * w;
    key_switch(-0.625 * w, y3);
    for (i = [0:5]) {
        key_switch(-(2.25 + i) * w, y3);
    }

    // row 4
    y4 = -3 * w;
    key_switch(0, y4);
    key_switch(-1.375 * w, y4);
    for (i = [0:4]) {
        key_switch(-(2.75 + i) * w, y4);
    }
    
    // row 5
    y5 = -4 * w;
    key_switch(-2.5 * w, y5);
    key_switch(-3.75 * w, y5);
    key_switch(-5 * w, y5);
    key_switch(-6.375 * w, y5);
}


module unit_cube(x, y) {
    translate([x, y, 0]) {
        cube([w, w, w], center = true);
    }
}