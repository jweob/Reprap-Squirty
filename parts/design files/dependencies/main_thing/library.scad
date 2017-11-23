// Parameters used for making cuts clean, holes round
$fs = 0.1;
big =9999;
small =0.001;

// The slot that the nut fits into on threaded rod assembly
thread_rod_slot_w =8.5;
thread_rod_slot_l =12;

// Threaded rod assembly
thread_rod_w = 13;
thread_rod_l = 40;
thread_rod_h = 24.15;
thread_rod_r=5.4/2;
thread_rod_z=20.15;

// Smooth rod 
smooth_rod_r=6/2;
smooth_rod_z=6;
smooth_rod_sep=30;

// Belt tunnel
belt_tunn_l = 7;
belt_tunn_h = 8.25;
belt_tunn_z = 3;
belt_tunn_sep = 13.5;

// Bearings for z axis
bearing_z = 20;
bearing_wall = 3;
bearing_l = 20;
bearing_sep = 22;
bearing_rad = 12.25/2;
bearing_gap = bearing_rad;
bearing_flange_w = bearing_wall;
bearing_flange_h = 8;
bearing_flange_bolt_r = 3.5/2;
bearing_to_rod = 25;

// Lugs for tightening on bearings
lug_w = (bearing_rad+bearing_wall)*2;
lug_l = bearing_sep+bearing_l*2;



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