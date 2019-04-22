pro_micro_house_w_x = 20;
pro_micro_house_w_y = 54;
pro_micro_house_gpio_area_w_y = 33;

padding_x = 1.5;
padding_y_t = 0.5;
padding_z_t = 1.5;
padding_z_b = 1.5;

pro_micro_house_h = 1.5;
spacer_h = 7;

spacer_l_x = 2.5;
spacer_r_x = 17.5;
spacer_b_y = 36;
spacer_t_y = 52.5;
spacer_r = 1;

spacer_scale_inverse = 10;

trrs_y = 42.5;
trrs_w_y = 6;
trrs_h = 6;

reset_switch_x = 6.5;
reset_switch_y = 38;
reset_switch_w_x = 7;
reset_switch_w_y = 2;

pro_micro_house_case();

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
        translate([0, trrs_y, spacer_h + padding_z_b - trrs_h]) {
            cube([padding_x, trrs_w_y, trrs_h], center = false);
        }
        translate([pro_micro_house_w_x + padding_x, trrs_y, spacer_h + padding_z_b - trrs_h]) {
            cube([padding_x, trrs_w_y, trrs_h], center = false);
        }
    }
}

module pro_micro_cube(y, w_y) {
    translate([padding_x, y - w_y, padding_z_b]) {
        cube([pro_micro_house_w_x, w_y, pro_micro_house_h + spacer_h + padding_z_t], center = false);
    }
}

module trrs_cube_l(w_x) {
    translate([-w_x + padding_x, trrs_y, spacer_h + padding_z_b - trrs_h]) {
        cube([w_x, trrs_w_y, trrs_h], center = false);
    }
}

module trrs_cube_r(w_x) {
    translate([pro_micro_house_w_x + padding_x, trrs_y, spacer_h + padding_z_b - trrs_h]) {
        cube([w_x, trrs_w_y, trrs_h], center = false);
    }
}