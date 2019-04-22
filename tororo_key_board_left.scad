use <key_switch.scad>

w_unit = 19.05; // unit width

plate_padding_x_l = 4; // plate padding x left 
plate_padding_x_r = 4; // plate padding x right
plate_padding_y_t = 4; // plate padding y top
plate_padding_y_b = 4; // plate padding y bottom

y1 = 0;      // row1
y2 = -w_unit;     // row2
y3 = -2 * w_unit; // row3
y4 = -3 * w_unit; // row4
y5 = -4 * w_unit; // row5

difference() {    
    plate();
    key_switches();
    unit_cube(7 * w_unit + plate_padding_x_r, y1 + w_unit);
    unit_cube(7 * w_unit + plate_padding_x_r, y1);
    unit_cube((1.5 + 5) * w_unit + plate_padding_x_r, y2);
    unit_cube((1.75 + 5) * w_unit + plate_padding_x_r, y3);
}

module plate() {
    plate_w_x = plate_padding_x_l + w_unit / 2 + 6.75 * w_unit + plate_padding_x_r;
    plate_w_y = plate_padding_y_t + w_unit / 2 + 4.5 * w_unit + plate_padding_y_b;
    plate_h = 4;

    translate([-w_unit / 2 - plate_padding_x_l, -plate_w_y + plate_padding_y_t + w_unit / 2, -plate_h]) {
        cube([plate_w_x, plate_w_y, plate_h], center = false);
    }
}

module key_switches() {
    // row 1
    for (i = [0:6]) {
        key_switch(i * w_unit, y1);
    }

    // row 2
    key_switch(0.25 * w_unit, y2);
    for (i = [0:4]) {
        key_switch((1.5 + i) * w_unit, y2);
    }

    // row 3
    key_switch(0.375 * w_unit, y3);
    for (i = [0:4]) {
        key_switch((1.75 + i) * w_unit, y3);
    }

    // row 4
    key_switch(0.625 * w_unit, y4);
    for (i = [0:4]) {
        key_switch((2.25 + i) * w_unit, y4);
    }
    
    // row 5
    key_switch(1.5 * w_unit, y5);
    key_switch(2.75 * w_unit, y5);
    key_switch(4 * w_unit, y5);
    key_switch(5.625 * w_unit, y5);
}

module unit_cube(x, y) {
    translate([x, y, 0]) {
        cube([w_unit, w_unit, w_unit], center = true);
    }
}