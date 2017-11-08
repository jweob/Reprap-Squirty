// X motor mount for RepRap Huxley variant
// Original x motor mount was designed in solidworks, this is aan OpenSCAD alternative with bearings instead of igus bushings + a mechanism for tightening the x belt up to 5mm
// jweob 2017-11-03

$fs = 0.1;

//
big =9999;
small =0.001;

m_bolt_rad = 3.5/2;
m_bolts_sep = 33.27;

m_block_xy = 32.5;
m_block_z = 14;

body_w = 57;
body_l = 46;
body_h = 12.4;

bearing_sep = 22;

belt_tunn_l = 7;
belt_tunn_h = 8.25;
belt_tunn_z = 3;
belt_tunn_sep = 13.5;

smooth_rod_r=6/2;
smooth_rod_z=2.85+smooth_rod_r;
smooth_rod_sep=30;

m_block_hole_r = 9;


thread_rod_w = 13;
thread_rod_l = 40;
thread_rod_h = 24.15;
thread_rod_r=5.4/2;
thread_rod_z=17.45+thread_rod_r;

thread_rod_slot_w =8.5;
thread_rod_slot_l =12;


bearing_rad = 12/2;
bearing_to_rod = 25;
bearing_x = body_w-thread_rod_w/2-bearing_to_rod;
bearing_z = 20;
bearing_wall = 3;
bearing_l = 20;
bearing_gap = bearing_rad;
bearing_flange_w = bearing_wall;
bearing_flange_h = 8;
bearing_flange_bolt_r = 3.5/2;

lug_w = (bearing_rad+bearing_wall)*2;
lug_l = bearing_sep+bearing_l*2;


sweep = 5;

belt_tighten_space = 2;
belt_tighten_w = 3;
belt_tighten_l = 6;
tighten_hole_x=+m_bolts_sep/2+sweep+m_bolt_rad+belt_tighten_space*2+belt_tighten_w;
belt_tighten_bolt_r=3.5/2;

mirror([0,1,0]) half_part();
half_part();


module half_part(){
difference(){
        union(){
            // Main body
            translate([0,-body_l/2,0]) cube([body_w, body_l, body_h]);
            
            // Z bearing assembly
            translate([bearing_x-lug_w/2, -(bearing_l+bearing_sep/2),0]) cube([lug_w,bearing_l,bearing_z]);
                translate([bearing_x, -(bearing_l+bearing_sep/2), bearing_z]) rotate([-90,0,0]) cylinder(r=(bearing_rad+bearing_wall), h=bearing_l);
            translate([bearing_x-bearing_flange_w- bearing_gap/2, -(bearing_l+bearing_sep/2),bearing_z+bearing_rad]) cube([(bearing_gap+bearing_flange_w*2),bearing_l,bearing_flange_h]);
                
            
            // Motor plinth
            translate([-sweep,-m_block_xy / sin(45) / 2,0]) union(){
                rotate([0,0,45]) cube([m_block_xy,m_block_xy, m_block_z]);
                cube([sweep, m_block_xy / sin(45), m_block_z]);
                translate([sweep,0,0]) rotate([0,0,45]) cube([m_block_xy,m_block_xy, m_block_z]);
            }
            
            // Z threaded rod assembly
            translate([body_w-thread_rod_w/2,0,thread_rod_h/2]) cube([thread_rod_w,thread_rod_l, thread_rod_h], center=true);
            
        }
      
        translate([-sweep,-m_block_xy / sin(45) / 2,-small]){
        // Motor & pulley groove
        translate([0,m_block_xy/sin(45)/2,-small]) slot(m_block_hole_r, sweep, big);
        
        // Bolt grooves
        translate([0,m_block_xy/sin(45)/2-m_bolts_sep/2,0]) slot(m_bolt_rad, sweep, big);
        translate([-m_bolts_sep/2, m_block_xy/sin(45)/2,0]) slot(m_bolt_rad, sweep, big);
        translate([+m_bolts_sep/2, m_block_xy/sin(45)/2,0]) slot(m_bolt_rad, sweep, big);
            }
            
       // Z bearings
       translate([bearing_x, -big/2, bearing_z]) rotate([-90,0,0]) cylinder(r=bearing_rad, h=big);
       translate([bearing_x, -big/2, bearing_z + big/2]) rotate([-90,0,0]) cube([bearing_gap,big,big], center=true);
       translate([0, -(bearing_l+bearing_sep)/2,bearing_z+bearing_rad+bearing_flange_h/2]) rotate([0,90,0]) cylinder(r=bearing_flange_bolt_r, h = big);
            
       // Hole for the belt
       translate([tighten_hole_x,-bearing_sep/2,-small]) rounded_cuboid([body_w-thread_rod_w-tighten_hole_x,bearing_sep,big],2);

       // Belt tunnels
       translate([0, -belt_tunn_l/2-belt_tunn_sep/2,belt_tunn_z]) cube([big, belt_tunn_l, belt_tunn_h-belt_tunn_l/2]);
       translate([0, -belt_tunn_sep/2,belt_tunn_z+belt_tunn_h-belt_tunn_l/2]) rotate([0,90,0]) cylinder(r=belt_tunn_l/2, h = big);
            
       // Smooth rods
       translate([0, -smooth_rod_sep/2,smooth_rod_z]) rotate([0,90,0]) cylinder(r=smooth_rod_r, h = big);
       
       // Z threaded rod assembly
       translate([body_w-thread_rod_w/2, -big/2,thread_rod_z]) rotate([-90,0,0]) cylinder(r=thread_rod_r, h = big);
       translate([body_w-thread_rod_w-small,-thread_rod_l/2,body_h])rotate([45,0,0]) cube([big,big, big]); // 45 degree angle
        translate([body_w-thread_rod_w/2,0,thread_rod_z+big/2]) cube([thread_rod_slot_w,thread_rod_slot_l, big], center=true);
        translate([body_w-thread_rod_w/2,0,thread_rod_z]) rotate([-90,30,0]) cylinder(r=thread_rod_slot_w/2/cos(30), h=thread_rod_slot_l, center=true, $fa=60); // Fake hexagon
            
       // Belt tightening hole
       translate([+m_bolts_sep/2+sweep+m_bolt_rad+belt_tighten_space+belt_tighten_w/2,0,big/2]) cube([belt_tighten_w,belt_tighten_l,big],center=true);
       translate([+m_bolts_sep/2, 0,body_h/2]) rotate([0,90,0]) cylinder(r=belt_tighten_bolt_r, h = tighten_hole_x-m_bolts_sep/2+small);
       
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