pro_micro_house_w_x = 22;
pro_micro_house_w_y = 54;
pro_micro_house_gpio_area_w_y = 34;

padding_x = 1.5;
padding_y_t = 0.5;
padding_z_t = 1.5;
padding_z_b = 1.5;

pro_micro_house_h = 1.5;
spacer_h = 7;

spacer_l_x = 3.5;
spacer_r_x = 18.5;
spacer_b_y = 36;
spacer_t_y = 52.5;
spacer_r = 1.3;

spacer_scale_inverse = 10;

trrs_y = 38.3;
trrs_w_y = 12; // trrs_y + trrs_w_y >= 49.5
trrs_h = 6.5;

reset_switch_x = 7.5;
reset_switch_y = 34;
reset_switch_w_x = 7;
reset_switch_w_y = 7.5 + 1;

pro_micro_house_trrs_left_case();
//pro_micro_house_trrs_right_case();

module pro_micro_house_trrs_left_case() {
    difference() {
        cube([pro_micro_house_w_x + padding_x, pro_micro_house_w_y + padding_y_t, pro_micro_house_h + spacer_h + padding_z_b + padding_z_t], center = false);
        translate([padding_x, 0, 0]) {
            cube([pro_micro_house_w_x, pro_micro_house_gpio_area_w_y, padding_z_b], center = false);
        }
        translate([padding_x, 0, padding_z_b]) {
            cube([pro_micro_house_w_x, pro_micro_house_w_y + padding_y_t, pro_micro_house_h + spacer_h + padding_z_t], center = false);
        }
        translate([spacer_l_x + padding_x, spacer_b_y, padding_z_b / 2]) {
            scale(1 / spacer_scale_inverse) {
                cylinder(r = spacer_scale_inverse * spacer_r, h = spacer_scale_inverse * padding_z_b, center = true);
            }
        }
        translate([spacer_l_x + padding_x, spacer_t_y, padding_z_b / 2]) {
            scale(1 / spacer_scale_inverse) {
                cylinder(r = spacer_scale_inverse * spacer_r, h = spacer_scale_inverse * padding_z_b, center = true);
            }
        }
        translate([spacer_r_x + padding_x, spacer_b_y, padding_z_b / 2]) {
            scale(1 / spacer_scale_inverse) {
                cylinder(r = spacer_scale_inverse * spacer_r, h = spacer_scale_inverse * padding_z_b, center = true);
            }
        }
        translate([spacer_r_x + padding_x, spacer_t_y, padding_z_b / 2]) {
            scale(1 / spacer_scale_inverse) {
                cylinder(r = spacer_scale_inverse * spacer_r, h = spacer_scale_inverse * padding_z_b, center = true);
            }
        }
        translate([padding_x + reset_switch_x, reset_switch_y, 0]) {
            cube([reset_switch_w_x, reset_switch_w_y, padding_z_b], center = false);
        }
        translate([0, trrs_y, 0]) {
            cube([padding_x + reset_switch_x + reset_switch_w_x, trrs_w_y, padding_z_b + pro_micro_house_h + spacer_h + padding_z_t], center = false);
        }
        translate([padding_x + reset_switch_x, 0, 0]) {
            cube([padding_x + reset_switch_x + reset_switch_w_x, pro_micro_house_w_y + padding_y_t, padding_z_b], center = false);
        }
    }
}

module pro_micro_house_trrs_right_case() {
    difference() {
        translate([padding_x, 0, 0]) {
            cube([pro_micro_house_w_x + padding_x, pro_micro_house_w_y + padding_y_t, pro_micro_house_h + spacer_h + padding_z_b + padding_z_t], center = false);
        }
        translate([padding_x, 0, 0]) {
            cube([pro_micro_house_w_x, pro_micro_house_gpio_area_w_y, padding_z_b], center = false);
        }
        translate([padding_x, 0, padding_z_b]) {
            cube([pro_micro_house_w_x, pro_micro_house_w_y + padding_y_t, pro_micro_house_h + spacer_h + padding_z_t], center = false);
        }
        translate([spacer_l_x + padding_x, spacer_b_y, padding_z_b / 2]) {
            scale(1 / spacer_scale_inverse) {
                cylinder(r = spacer_scale_inverse * spacer_r, h = spacer_scale_inverse * padding_z_b, center = true);
            }
        }
        translate([spacer_l_x + padding_x, spacer_t_y, padding_z_b / 2]) {
            scale(1 / spacer_scale_inverse) {
                cylinder(r = spacer_scale_inverse * spacer_r, h = spacer_scale_inverse * padding_z_b, center = true);
            }
        }
        translate([spacer_r_x + padding_x, spacer_b_y, padding_z_b / 2]) {
            scale(1 / spacer_scale_inverse) {
                cylinder(r = spacer_scale_inverse * spacer_r, h = spacer_scale_inverse * padding_z_b, center = true);
            }
        }
        translate([spacer_r_x + padding_x, spacer_t_y, padding_z_b / 2]) {
            scale(1 / spacer_scale_inverse) {
                cylinder(r = spacer_scale_inverse * spacer_r, h = spacer_scale_inverse * padding_z_b, center = true);
            }
        }
        translate([padding_x + reset_switch_x, reset_switch_y, 0]) {
            cube([reset_switch_w_x, reset_switch_w_y, padding_z_b], center = false);
        }
        translate([pro_micro_house_w_x + padding_x - (reset_switch_x + reset_switch_w_x), trrs_y, 0]) {
            cube([padding_x + reset_switch_x + reset_switch_w_x, trrs_w_y, padding_z_b + pro_micro_house_h + spacer_h + padding_z_t], center = false);
        }
        cube([padding_x + reset_switch_x + reset_switch_w_x, pro_micro_house_w_y + padding_y_t, padding_z_b], center = false);
    }
}

module pro_micro_house_case() {
    difference() {
        cube([pro_micro_house_w_x + 2 * padding_x, pro_micro_house_w_y + padding_y_t, pro_micro_house_h + spacer_h + padding_z_b + padding_z_t], center = false);
        translate([padding_x, 0, 0]) {
            cube([pro_micro_house_w_x, pro_micro_house_gpio_area_w_y, padding_z_b], center = false);
        }
        translate([padding_x, 0, padding_z_b]) {
            cube([pro_micro_house_w_x, pro_micro_house_w_y + padding_y_t, pro_micro_house_h + spacer_h + padding_z_t], center = false);
        }
        translate([spacer_l_x + padding_x, spacer_b_y, padding_z_b / 2]) {
            scale(1 / spacer_scale_inverse) {
                cylinder(r = spacer_scale_inverse * spacer_r, h = spacer_scale_inverse * padding_z_b, center = true);
            }
        }
        translate([spacer_l_x + padding_x, spacer_t_y, padding_z_b / 2]) {
            scale(1 / spacer_scale_inverse) {
                cylinder(r = spacer_scale_inverse * spacer_r, h = spacer_scale_inverse * padding_z_b, center = true);
            }
        }
        translate([spacer_r_x + padding_x, spacer_b_y, padding_z_b / 2]) {
            scale(1 / spacer_scale_inverse) {
                cylinder(r = spacer_scale_inverse * spacer_r, h = spacer_scale_inverse * padding_z_b, center = true);
            }
        }
        translate([spacer_r_x + padding_x, spacer_t_y, padding_z_b / 2]) {
            scale(1 / spacer_scale_inverse) {
                cylinder(r = spacer_scale_inverse * spacer_r, h = spacer_scale_inverse * padding_z_b, center = true);
            }
        }
        translate([padding_x + reset_switch_x, reset_switch_y, 0]) {
            cube([reset_switch_w_x, reset_switch_w_y, padding_z_b], center = false);
        }
        translate([0, trrs_y, padding_z_b]) {
            cube([padding_x, trrs_w_y, pro_micro_house_h + spacer_h + padding_z_t], center = false);
        }
        translate([pro_micro_house_w_x + padding_x, trrs_y, padding_z_b]) {
            cube([padding_x, trrs_w_y, pro_micro_house_h + spacer_h + padding_z_t], center = false);
        }
    }
}

module pro_micro_cube(y, w_y) {
    translate([padding_x, y - w_y, 0]) {
        cube([pro_micro_house_w_x, w_y, padding_z_b + pro_micro_house_h + spacer_h + padding_z_t], center = false);
    }
}

module trrs_cube_l(w_x) {
    translate([-w_x + padding_x, trrs_y, 0]) {
        cube([w_x, trrs_w_y, padding_z_b + pro_micro_house_h + spacer_h + padding_z_t], center = false);
    }
}

module trrs_cube_r(w_x) {
    translate([pro_micro_house_w_x + padding_x, trrs_y, 0]) {
        cube([w_x, trrs_w_y, padding_z_b + pro_micro_house_h + spacer_h + padding_z_t], center = false);
    }
}

module pro_micro_house_left_padding_cube(w_x) {
    difference() {
        translate([-w_x, 0, 0]) {
            cube([w_x, pro_micro_house_w_y + padding_y_t, pro_micro_house_h + spacer_h + padding_z_b + padding_z_t], center = false);
        }
        trrs_cube_l(padding_x + w_x);
    }
}

module pro_micro_house_right_padding_cube(w_x) {
    difference() {
        translate([pro_micro_house_w_x + 2 * padding_x, 0, 0]) {
            cube([w_x, pro_micro_house_w_y + padding_y_t, pro_micro_house_h + spacer_h + padding_z_b + padding_z_t], center = false);
        }
        trrs_cube_r(padding_x + w_x);
    }
}