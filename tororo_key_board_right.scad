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
    base_top_plate();
    key_switches();
    unit_cube(-8 * w_unit - plate_padding_x_l, y1 + w_unit);
    unit_cube(-8 * w_unit - plate_padding_x_l, y1);
    unit_cube(-(2.25 + 6) * w_unit - plate_padding_x_l, y3);
    unit_cube(-(2.75 + 5) * w_unit - plate_padding_x_l, y4);
    unit_cube(-(2.75 + 5) * w_unit - plate_padding_x_l, y5);
    unit_cube(-(2.75 + 5) * w_unit - plate_padding_x_l, y5 - w_unit);
}

module base_top_plate() {
    plate_w_x = plate_padding_x_l + w_unit / 2 + 8 * w_unit + plate_padding_x_r;
    plate_w_y = plate_padding_y_t + w_unit / 2 + 4.5 * w_unit + plate_padding_y_b;
    plate_h = 4;

    translate([-plate_w_x + w_unit / 2 + plate_padding_x_r, -plate_w_y + plate_padding_y_t + w_unit / 2, -plate_h]) {
        cube([plate_w_x, plate_w_y, plate_h], center = false);
    }
}

module key_switches() {
    // row 1
    y1 = 0;
    for (i = [0:7]) {
        key_switch(-i * w_unit, y1);
    }

    // row 2
    y2 = -w_unit;
    key_switch(-0.25 * w_unit, y2);
    for (i = [0:6]) {
        key_switch(-(1.5 + i) * w_unit, y2);
    }

    // row 3
    y3 = -2 * w_unit;
    key_switch(-0.625 * w_unit, y3);
    for (i = [0:5]) {
        key_switch(-(2.25 + i) * w_unit, y3);
    }

    // row 4
    y4 = -3 * w_unit;
    key_switch(0, y4);
    key_switch(-1.375 * w_unit, y4);
    for (i = [0:4]) {
        key_switch(-(2.75 + i) * w_unit, y4);
    }
    
    // row 5
    y5 = -4 * w_unit;
    key_switch(-2.5 * w_unit, y5);
    key_switch(-3.75 * w_unit, y5);
    key_switch(-5 * w_unit, y5);
    key_switch(-6.375 * w_unit, y5);
}


module unit_cube(x, y) {
    translate([x, y, 0]) {
        cube([w_unit, w_unit, w_unit], center = true);
    }
}