use <key_switch.scad>
use <pro_micro_house_case.scad>

w_unit = 19.05; // unit width

y1 = 0;           // row1
y2 = -w_unit;     // row2
y3 = -2 * w_unit; // row3
y4 = -3 * w_unit; // row4
y5 = -4 * w_unit; // row5

plate_padding_x_l = 4; // plate padding x left 
plate_padding_x_r = 4; // plate padding x right
plate_padding_y_t = 4; // plate padding y top
plate_padding_y_b = 4; // plate padding y bottom

plate_w_x = plate_padding_x_l + w_unit / 2 + 8 * w_unit + plate_padding_x_r;
plate_w_y = plate_padding_y_t + w_unit / 2 + 4.5 * w_unit + plate_padding_y_b;
plate_h = 4;

foot_w = 4;
foot_h = 30;

keyboard_h_low = 10;
keyboard_h_high = 25;

plate_rotation_x = asin((keyboard_h_high - keyboard_h_low) / plate_w_y);

base_cube_dz = -(plate_w_y * (keyboard_h_high + keyboard_h_low) * sin(plate_rotation_x) / (keyboard_h_high - keyboard_h_low) - plate_h * cos(plate_rotation_x)) / 2;

pro_micro_dy = 0.2;

keyboard();

module keyboard() {
    difference() {
        union() {
            keyboard_case();
            pro_micro();
        }
        translate([w_unit / 2 + plate_padding_x_l, -w_unit / 2 - plate_padding_y_t + pro_micro_dy, base_cube_dz]) {
            rotate([0, 0, 90]) {
                trrs_cube_r(2 * plate_padding_y_t);
            }
        }
        translate([w_unit / 2 + plate_padding_x_l, -w_unit / 2 - plate_padding_y_t + pro_micro_dy, base_cube_dz]) {
            rotate([0, 0, 90]) {
                pro_micro_cube(plate_padding_x_r, 2 * plate_padding_x_r);
            }
        }
    }
}

module pro_micro() {
    translate([w_unit / 2 + plate_padding_x_r, -w_unit / 2 - plate_padding_y_t + pro_micro_dy, base_cube_dz]) {
        rotate([0, 0, 90]) {
            union() {
                pro_micro_house_right_padding_cube(1);
                pro_micro_house_case();
            }
        }
    }
}

module keyboard_case() {
    difference() {
        untranslate_plate_origin_in_yz_plane() {
            rotate([plate_rotation_x, 0, 0]) {
                translate_plate_origin_in_yz_plane() {
                    union() {
                        keyboard_plate();
                        foot();
                    }
                }
            }
        }
        base_cube();
    }
}

module base_cube() {
    base_cube_h = 100;
    base_cube_extension_y = 10;
    translate_from_origin_to_plate_right_bottom() {
        translate([-plate_w_x, 0, base_cube_dz - base_cube_h]) {
            cube([plate_w_x, plate_w_y + base_cube_extension_y, base_cube_h], center = false);
        } 
    }
}

module foot() {
    union() {
        dz = -plate_h - foot_h;

         // top
        translate_from_origin_to_plate_right_top() {
            translate([-plate_w_x + w_unit / 2, -foot_w, dz]) {
                cube([plate_w_x - w_unit / 2, foot_w, foot_h], center = false);
            }
        }

        // right
        translate_from_origin_to_plate_right_bottom() {
            translate([-foot_w, 0, dz]) {
                cube([foot_w, plate_w_y, foot_h], center = false);
            }
        }

        // bottom
        translate_from_origin_to_plate_right_bottom() {
            translate([-plate_w_x + w_unit * 0.75, 0, dz]) {
                cube([plate_w_x - w_unit * 0.75, foot_w, foot_h], center = false);
            }
        }
    }
}

module keyboard_plate() {
    difference() {    
        plate();
        key_switches();
        unit_cube(-8 * w_unit - plate_padding_x_l, y1 + w_unit);
        unit_cube(-8 * w_unit - plate_padding_x_l, y1);
        unit_cube(-(2.25 + 6) * w_unit - plate_padding_x_l, y3);
        unit_cube(-(2.75 + 5) * w_unit - plate_padding_x_l, y4);
        unit_cube(-(2.75 + 5) * w_unit - plate_padding_x_l, y5);
        unit_cube(-(2.75 + 5) * w_unit - plate_padding_x_l, y5 - w_unit);
    }
}

module plate() {
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

// operator modules

module translate_plate_origin_in_yz_plane() {
    translate([0, plate_w_y / 2, plate_h / 2]) {
        translate([0, -w_unit / 2 - plate_padding_y_t, 0]) {
            children();
        }
    }
}

module untranslate_plate_origin_in_yz_plane() {
    translate([0, w_unit / 2 + plate_padding_y_t, 0]) {
        translate([0, -plate_w_y / 2, -plate_h / 2]) {
            children();
        }
    }
}

module translate_from_origin_to_plate_right_bottom() {
    translate_from_origin_to_plate_right_top() {
        translate([0, -plate_w_y, 0]) {
            children();
        }
    }
}

module translate_from_origin_to_plate_right_top() {
    translate([w_unit / 2 + plate_padding_x_r, w_unit / 2 + plate_padding_y_t, 0]) {
        children();
    }
}