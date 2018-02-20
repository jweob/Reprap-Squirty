// X motor idler for RepRap Huxley variant
// Original x motor mount was designed in solidworks, this is aan OpenSCAD alternative with bearings instead of igus bushings + a mechanism for tightening the x belt up to 5mm
// jweob 2017-11-03

include <..\parts\design files\dependencies\main_thing\library.scad>;

bearing_x = 0;

body_w = bearing_rad+bearing_wall+bearing_to_rod+thread_rod_w/2;
body_l = 46;
body_h = 12.4;

bearing_to_idler_x = 7;
idler_r_1 = 3.3/2;
idler_r_2 = 6/2;
idler_h_2=3.5;
idler_r_3 = 20.3/2;

rod_nut_hole_x = 0.5;
rod_nut_hole_w = 3;
rod_nut_hole_l = 5.8;
rod_nut_hole_r = 3.4/2;

// Top level
mirror([0,1,0]) half_part();
//half_part();


module half_part(){
difference(){
        union(){
            // Body
            translate([-(bearing_rad+bearing_wall),-body_l/2,0]) cube([body_w, body_l, body_h]);
            
            
            // Z bearing assembly
            translate([bearing_x-lug_w/2, -(bearing_l+bearing_sep/2),0]) cube([lug_w,bearing_l,bearing_z]);
                translate([bearing_x, -(bearing_l+bearing_sep/2), bearing_z]) rotate([-90,0,0]) cylinder(r=(bearing_rad+bearing_wall), h=bearing_l);
            translate([bearing_x-bearing_flange_w- bearing_gap/2, -(bearing_l+bearing_sep/2),bearing_z+bearing_rad]) cube([(bearing_gap+bearing_flange_w*2),bearing_l,bearing_flange_h]);
              
            
            // Z threaded rod assembly
            translate([bearing_to_rod,0,thread_rod_h/2]) cube([thread_rod_w,thread_rod_l, thread_rod_h], center=true);
            
        }
      
            
       // Z bearings
       translate([bearing_x, -big/2, bearing_z]) rotate([-90,0,0]) cylinder(r=bearing_rad, h=big);
       translate([bearing_x, -big/2, bearing_z + big/2]) rotate([-90,0,0]) cube([bearing_gap,big,big], center=true);
       translate([0, -(bearing_l+bearing_sep)/2,bearing_z+bearing_rad+bearing_flange_h/2]) rotate([0,90,0]) cylinder(r=bearing_flange_bolt_r, h = big);
            


       // Belt tunnels
       translate([-big/2, -belt_tunn_l/2-belt_tunn_sep/2,belt_tunn_z]) cube([big, belt_tunn_l, belt_tunn_h-belt_tunn_l/2]);
       translate([-big/2, -belt_tunn_sep/2,belt_tunn_z+belt_tunn_h-belt_tunn_l/2]) rotate([0,90,0]) cylinder(r=belt_tunn_l/2, h = big);
            
       // Smooth rods
       translate([rod_nut_hole_x+rod_nut_hole_w/2, -smooth_rod_sep/2,smooth_rod_z]) rotate([0,90,0]) cylinder(r=smooth_rod_r, h = big);
       
       // Z threaded rod assembly
       translate([bearing_to_rod, -big/2,thread_rod_z]) rotate([-90,0,0]) cylinder(r=thread_rod_r, h = big);
       translate([bearing_to_rod-thread_rod_w/2-small,-thread_rod_l/2,body_h])rotate([45,0,0]) cube([big,big, big]); // 45 degree angle
        translate([bearing_to_rod,0,thread_rod_z+big/2]) cube([thread_rod_slot_w,thread_rod_slot_l, big], center=true);
        translate([bearing_to_rod,0,thread_rod_z]) rotate([-90,30,0]) cylinder(r=thread_rod_slot_w/2/cos(30), h=thread_rod_slot_l, center=true, $fa=60); // Fake hexagon
            
       // Smooth rod nut hole
       translate([rod_nut_hole_x,-smooth_rod_sep/2,smooth_rod_z-big/2]) cube([rod_nut_hole_w,rod_nut_hole_l,big],center=true);
       translate([-big/2, -smooth_rod_sep/2,smooth_rod_z]) rotate([0,90,0]) cylinder(r=rod_nut_hole_r, h = big);
       
       
      translate([rod_nut_hole_x,-smooth_rod_sep/2,smooth_rod_z]) rotate([0,90,0]) cylinder(r=rod_nut_hole_l/2/cos(30), h=rod_nut_hole_w, center=true, $fa=60); // Fake hexagon
       
       
       translate([bearing_to_idler_x,0,-small]) cylinder(r=idler_r_1,h=big);
       difference(){
       translate([bearing_to_idler_x,0,belt_tunn_z]) cylinder(r=idler_r_3,h=big);
       translate([bearing_to_idler_x,0,-small]) cylinder(r=idler_r_2,h=idler_h_2+small);
       }
       
       // Mirror line
       translate([-big/2,small,-big/2]) cube([big,big,big]);
        
        
}

}

module slot (rad, stretch, height) {
    translate([0,0,0]) cylinder(r=rad,h=height);
    translate([0,-rad,0])cube([stretch, rad*2, height]);
    translate([stretch,0,0]) cylinder(r=rad,h=height);
    }

module rounded_cuboid(xyz, r){
    //translate([-xyz[0]/2,-xyz[1]/2,0]) union(){
    translate([r,r,0]) cylinder(r=r, h=xyz[2]);
    translate([r,xyz[1]-r,0]) cylinder(r=r, h=xyz[2]);
    translate([xyz[0]-r,xyz[1]-r,0]) cylinder(r=r, h=xyz[2]);
    translate([xyz[0]-r,r,0]) cylinder(r=r, h=xyz[2]);
    translate([0,r,0]) cube([xyz[0],xyz[1]-r*2, xyz[2]]);
    translate([r,0,0]) cube([xyz[0]-r*2,xyz[1], xyz[2]]);
    //}
    }