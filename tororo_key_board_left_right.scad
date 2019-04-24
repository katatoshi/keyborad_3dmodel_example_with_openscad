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

plate_w_x = plate_padding_x_l + w_unit / 2 + 6.75 * w_unit + plate_padding_x_r;
plate_w_y = plate_padding_y_t + w_unit / 2 + 4.5 * w_unit + plate_padding_y_b;
plate_h = 4;

foot_w = 4;
foot_h = 30;

keyboard_h_low = 10;
keyboard_h_high = 25;

plate_rotation_x = asin((keyboard_h_high - keyboard_h_low) / plate_w_y);
echo("plate_rotation_x = ", plate_rotation_x);

base_cube_dz = -(plate_w_y * (keyboard_h_high + keyboard_h_low) * sin(plate_rotation_x) / (keyboard_h_high - keyboard_h_low) - plate_h * cos(plate_rotation_x)) / 2;

screw_r = 1.3;
screw_scale_inverse = 10;

keyboard();

module keyboard() {
    difference() {
        /*
        union() {
            keyboard_case();
            pro_micro();
        }
        */
        keyboard_case();
        translate([-w_unit / 2 - plate_padding_x_l, w_unit / 2 + plate_padding_y_t - 1.5, base_cube_dz]) {
            rotate([0, 0, -90]) {
                trrs_cube_l(2 * plate_padding_y_t);
            }
        }
        translate([-w_unit / 2 - plate_padding_x_l, w_unit / 2 + plate_padding_y_t - 1.5, base_cube_dz]) {
            rotate([0, 0, -90]) {
                pro_micro_cube(plate_padding_x_l, 2 * plate_padding_x_l);
            }
        }
    }
}

module pro_micro() {
    translate([-w_unit / 2 - plate_padding_x_l, w_unit / 2 + plate_padding_y_t - 1.5, base_cube_dz]) {
        rotate([0, 0, -90]) {
            pro_micro_house_case();
        }
    }
}

module keyboard_case() {
    difference() {
        untranslate_plate_origin_in_yz_plane() {
            rotate([plate_rotation_x, 0, 0]) {
                translate_plate_origin_in_yz_plane() {
                    difference() {
                        union() {
                            keyboard_plate();
                            foot();
                        }
                        left_margins();
                        screws();
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
    translate_from_origin_to_plate_left_bottom() {
        translate([0, 0, base_cube_dz - base_cube_h]) {
            cube([plate_w_x, plate_w_y + base_cube_extension_y, base_cube_h], center = false);
        } 
    }
}

module screws() {
    dz_screw_top_1 = -8;
    dz_screw_top_2 = -18;

    dz_screw_bottom = -6.1;

    // foot top
    translate([plate_padding_x_l + 3 * w_unit + w_unit / 2 , -foot_w / 2, dz_screw_top_1]) {
        translate_from_origin_to_plate_left_top() {
            screw();
        }
    }
    translate([plate_padding_x_l + 3 * w_unit + w_unit / 2 , -foot_w / 2, dz_screw_top_2]) {
        translate_from_origin_to_plate_left_top() {
            screw();
        }
    }

    // foot bottom
    translate([plate_padding_x_l + 4 * w_unit + w_unit / 2, foot_w / 2, dz_screw_bottom]) {
        translate_from_origin_to_plate_left_bottom() {
            screw();
        }
    }
}

module screw() {
    rotate([90, 0, 0]) {
        scale(1 / screw_scale_inverse) {
            cylinder(r = screw_scale_inverse * screw_r, h = screw_scale_inverse * foot_w, center = true);
        }
    }
}

module right_margins() {
    margin = 5 * w_unit;
    
    // padding top
    padding_top_cube_with_right_margin(3 * w_unit, y1 + w_unit / 2 + 3 * plate_padding_y_t / 4, 2 * foot_h, margin);
    padding_top_cube_with_right_margin(4 * w_unit, y1 + w_unit / 2 + plate_padding_y_t / 4, 2 * foot_h, margin);

    // row 1
    unit_cube_with_right_margin(4 * w_unit, y1, margin);

    // row 2
    unit_cube_with_right_margin((1.5 + 2) * w_unit, y2, margin);

    // row 3
    unit_cube_with_right_margin((1.75 + 2) * w_unit, y3, margin);

    // row 4
    unit_cube_with_right_margin((2.25 + 2) * w_unit, y4, margin);
    
    // row 5
    unit_cube_with_right_margin(4 * w_unit, y5, margin);
    
    // padding bottom
    padding_bottom_cube_with_right_margin(4 * w_unit, y5 - w_unit / 2 - plate_padding_y_b / 4, 2 * foot_h, margin);
    padding_bottom_cube_with_right_margin(5 * w_unit, y5 - w_unit / 2 - 3 * plate_padding_y_t / 4, 2 * foot_h, margin);
}

module left_margins() {
    margin = 6 * w_unit;
    
    // padding top
    padding_top_cube_with_left_margin(2 * w_unit, y1 + w_unit / 2 + 3 *  plate_padding_y_t / 4, 2 * foot_h, margin);
    padding_top_cube_with_left_margin(3 * w_unit, y1 + w_unit / 2 + plate_padding_y_t / 4, 2 * foot_h, margin);

    // row 1
    unit_cube_with_left_margin(3 * w_unit, y1, margin);

    // row 2
    unit_cube_with_left_margin((1.5 + 1) * w_unit, y2, margin);

    // row 3
    unit_cube_with_left_margin((1.75 + 1) * w_unit, y3, margin);

    // row 4
    unit_cube_with_left_margin((2.25 + 1) * w_unit, y4, margin);
    
    // row 5
    unit_cube_with_left_margin(3 * w_unit, y5, margin);
    
    // padding bottom
    padding_bottom_cube_with_left_margin(3 * w_unit, y5 - w_unit / 2 - plate_padding_y_b / 4, 2 * foot_h, margin);
    padding_bottom_cube_with_left_margin(4 * w_unit, y5 - w_unit / 2 - 3 *  plate_padding_y_t / 4, 2 * foot_h, margin);
}

module foot() {
    union() {
        dz = -plate_h - foot_h;

         // top
        translate_from_origin_to_plate_left_top() {
            translate([0, -foot_w, dz]) {
                cube([plate_w_x - w_unit / 4, foot_w, foot_h], center = false);
            }
        }

        /*
        // left
        translate_from_origin_to_plate_left_bottom() {
            translate([0, 0, dz]) {
                cube([foot_w, plate_w_y, foot_h], center = false);
            }
        }
        */

        // bottom
        translate_from_origin_to_plate_left_bottom() {
            translate([0, 0, dz]) {
                cube([plate_w_x, foot_w, foot_h], center = false);
            }
        }
    }
}

module keyboard_plate() {
    difference() {    
        plate();
        key_switches();
        unit_cube(7 * w_unit + plate_padding_x_r, y1 + w_unit);
        unit_cube(7 * w_unit + plate_padding_x_r, y1);
        unit_cube((1.5 + 5) * w_unit + plate_padding_x_r, y2);
        unit_cube((1.75 + 5) * w_unit + plate_padding_x_r, y3);
    }
}

module plate() {
    translate([0, 0, -plate_h]) {
        translate_from_origin_to_plate_left_bottom() {
            cube([plate_w_x, plate_w_y, plate_h], center = false);
        }
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

module unit_cube_with_right_margin(x, y, m) {
    translate([x, y, 0]) {
        translate([-w_unit / 2, -w_unit / 2, -w_unit / 2]) {
            cube([w_unit + m, w_unit, w_unit], center = false);
        }
    }
}

module padding_top_cube_with_right_margin(x, y, h, m) {
    translate([x, y, 0]) {
        translate([-w_unit / 2, -plate_padding_y_t / 4, -h / 2]) {
            cube([w_unit + m, plate_padding_y_t / 2, h], center = false);
        }
    }
}

module padding_bottom_cube_with_right_margin(x, y, h, m) {
    translate([x, y, 0]) {
        translate([-w_unit / 2, -plate_padding_y_b / 4, -h / 2]) {
            cube([w_unit + m, plate_padding_y_b / 2, h], center = false);
        }
    }
}

module unit_cube_with_left_margin(x, y, m) {
    translate([x, y, 0]) {
        translate([-w_unit / 2 - m, -w_unit / 2, -w_unit / 2]) {
            cube([w_unit + m, w_unit, w_unit], center = false);
        }
    }
}

module padding_top_cube_with_left_margin(x, y, h, m) {
    translate([x, y, 0]) {
        translate([-w_unit / 2 - m, -plate_padding_y_t / 4, -h / 2]) {
            cube([w_unit + m, plate_padding_y_t / 2, h], center = false);
        }
    }
}

module padding_bottom_cube_with_left_margin(x, y, h, m) {
    translate([x, y, 0]) {
        translate([-w_unit / 2 - m, -plate_padding_y_b / 4, -h / 2]) {
            cube([w_unit + m, plate_padding_y_b / 2, h], center = false);
        }
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
    translate_from_origin_to_plate_left_bottom() {
        translate([plate_w_x, 0, 0]) {
            children();
        }
    }
}

module translate_from_origin_to_plate_right_row4_top() {
    translate_from_origin_to_plate_left_top() {
        translate([plate_w_x, -plate_padding_y_t - 3 * w_unit, 0]) {
            children();
        }
    }
}

module translate_from_origin_to_plate_right_row3_top() {
    translate_from_origin_to_plate_left_top() {
        translate([
            plate_padding_x_l + (1.75 + 5) * w_unit + plate_padding_x_r,
            -plate_padding_y_t - 2 * w_unit,
            0
        ]) {
            children();
        }
    }
}

module translate_from_origin_to_plate_right_row2_top() {
    translate_from_origin_to_plate_left_top() {
        translate([
            plate_padding_x_l + (1.5 + 5) * w_unit + plate_padding_x_r,
            -plate_padding_y_t - w_unit,
            0
        ]) {
            children();
        }
    }
}

module translate_from_origin_to_plate_right_row1_top() {
    translate_from_origin_to_plate_left_top() {
        translate([plate_w_x - w_unit / 4, 0, 0]) {
            children();
        }
    }
}

module translate_from_origin_to_plate_left_bottom() {
    translate_from_origin_to_plate_left_top() {
        translate([0, -plate_w_y, 0]) {
            children();
        }
    }
}

module translate_from_origin_to_plate_left_top() {
    translate([-w_unit / 2 - plate_padding_x_l, w_unit / 2 + plate_padding_y_t, 0]) {
        children();
    }
}