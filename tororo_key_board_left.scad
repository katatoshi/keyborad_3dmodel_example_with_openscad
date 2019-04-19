use <key_switch.scad>

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