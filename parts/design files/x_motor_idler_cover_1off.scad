
include <dependencies\main_thing\library.scad>;

rad_1 = 21.5/2;
h_1 = 2;
rad_2 = 19.5/2;
h_2 = 4.6;
rad_3a = 8;
rad_3b = 3;
h_3 = 6.7;
hole_r = 3.5/2;

difference(){
    union(){
        cylinder(r=rad_1, h=h_1);
        cylinder(r=rad_2, h=h_2);
        cylinder(r1=rad_3a, r2=rad_3b, h=h_3);
    }
    translate([0,0,-small]) cylinder(r=hole_r,h=big);
}
