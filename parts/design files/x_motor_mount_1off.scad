// X motor mount for RepRap Huxley variant
// Original x motor mount was designed in solidworks, this is aan OpenSCAD alternative with bearings instead of igus bushings + a mechanism for tightening the x belt up to 5mm
// jweob 2017-11-03

include <dependencies\main_thing\library.scad>;

// Center point for reference is the center of the motor in its position nearest to smooth rod


// Bolts that attach motor
m_bolt_rad = 3.5/2;
m_bolts_sep_untilted = 26;
m_bolts_sep = 2 * sin(45) * m_bolts_sep_untilted;


// How much the motor can be adjusted by in x direction
sweep = 5;

// Motor block
m_block_xy = 32.5;
m_block_z = 14;
m_block_hole_r1 = 9;
m_block_hole_r2 = 23/2;
m_block_depth = 2.5;

// Overall body (excluding motor block)
body_w = 57;
body_l = 46;
body_h = 12.4;

// Bearing info
bearing_x = body_w-thread_rod_w/2-bearing_to_rod;

// Belt tightening hole
belt_tighten_space = 2;
belt_tighten_w = 3;
belt_tighten_l = 6;
tighten_hole_x=+m_bolts_sep/2+sweep+m_bolt_rad+belt_tighten_space*2+belt_tighten_w;
belt_tighten_bolt_r=3.5/2;
belt_tighten_cap_r=5.5/2;

// Limit switch mount
switch_hole_r = 2.5/2;
switch_hole_x = 57 - (5.75+2.5/2);
switch_hole_y = 10.5;
switch_hole_sep_y = 9.5;
switch_hole_h = 6;
//echo(body_l/2-(switch_hole_y+switch_hole_sep_y));

// Bearing retainers
bear_retain_w = 8;
bear_retain_h = bearing_rad+bearing_wall+bearing_z;
bear_retain_y = 27.5;
bear_retain_x = bearing_x;
bear_retain_l = ((bearing_l+bearing_sep/2)-bear_retain_y)*2;
bear_retain_r = 3.5/2;
bear_retain_hole_w=2.5;
bear_retain_hole_h=6;
       


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
            
            // Z bearing retainers
            translate([-(bear_retain_w+bearing_rad)+bear_retain_x,-bear_retain_y-bear_retain_l/2,0]) cube([bear_retain_w+bearing_rad, bear_retain_l, bear_retain_h]);
            
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
        translate([0,m_block_xy/sin(45)/2,-small]) slot(m_block_hole_r1, sweep, big);
        translate([0,m_block_xy/sin(45)/2, m_block_z-m_block_depth]) slot(m_block_hole_r2, sweep, big);
        
        // Bolt grooves
        translate([0,m_block_xy/sin(45)/2-m_bolts_sep/2,0]) slot(m_bolt_rad, sweep, big);
        translate([-m_bolts_sep/2, m_block_xy/sin(45)/2,0]) slot(m_bolt_rad, sweep, big);
        translate([+m_bolts_sep/2, m_block_xy/sin(45)/2,0]) slot(m_bolt_rad, sweep, big);
            }
            
       // Z bearings
       translate([bearing_x, -big/2, bearing_z]) rotate([-90,0,0]) cylinder(r=bearing_rad, h=big);
       translate([bearing_x, -big/2, bearing_z + big/2]) rotate([-90,0,0]) cube([bearing_gap,big,big], center=true);
            
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
       translate([+m_bolts_sep/2+sweep+m_bolt_rad+belt_tighten_space+belt_tighten_w/2,0,big/2]) cube([belt_tighten_w,belt_tighten_l,big],center=true);
       translate([tighten_hole_x, 0,body_h/2]) rotate([0,90,0]) cylinder(r=belt_tighten_cap_r, h = big);
       
       // Z bearing retainers
       translate([bear_retain_x,0,0]){
       translate([-big, -bear_retain_y, bearing_z]) rotate([0,90,0])cylinder(r=bear_retain_r , h=big);
       translate([-(bear_retain_w/2+bearing_rad), -bear_retain_y-small/2, bearing_z]) rotate([-90,0,0]) rotate([0,90,0]) nut_pocket();
       translate([bearing_x, -big/2, bearing_z + big/2]) rotate([-90,0,0]) cube([bearing_gap,big,big], center=true);
       }
       
       //Switch hole
       translate([switch_hole_x, -switch_hole_y, -small]) cylinder(r=switch_hole_r, h=switch_hole_h+small);
       translate([switch_hole_x, -switch_hole_y-switch_hole_sep_y, -small]) cylinder(r=switch_hole_r, h=switch_hole_h+small);
       
       // Mirror line
       translate([-big/2,small,-big/2]) cube([big,big,big]);
        
        
}

}
