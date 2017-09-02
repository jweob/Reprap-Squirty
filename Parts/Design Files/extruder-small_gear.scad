include <dependencies/parametric_involute_gear_v5.0.scad>
//small gear was 9tooth, 200pitch
//large gear was 53tooth, 200pitch

//small gear was 9tooth, 260pitch
//large gear was 39tooth, 260pitch


translate([0,0,14]) rotate([0,180,20])
	small_gear();
//translate([0,0,7])

module small_gear(){
translate ([0,0,0]) difference(){
	gear (
	number_of_teeth=11,
	circular_pitch=200, diametral_pitch=false,
	pressure_angle=28,
	clearance = 0.2,
	gear_thickness=7,
	rim_thickness=7,
	rim_width=5.3,
	hub_thickness=14,
	hub_diameter=18,
	bore_diameter=5.2,
	circles=0,
	backlash=0,
	twist=0,
	involute_facets=0);
	//translate([0,0,11]) rotate([90,0,0]) cylinder(h=16,r=2.7/2,$fn=30);
	translate([0,10,10.6]) rotate([-90,0,180]) union()
	{
		//entrance
		//translate([0,-3,15]) cube([5.8,7,3],center=true);
		translate([0,-3,15]) cube([2*(5.8/sqrt(3)),6,3],center=true);
		//nut
		translate([0,0,13.5]) rotate([0,0,0])cylinder(r=5.8/sqrt(3),h=3,$fn=6);
		//grub hole
		translate([0,0,9]) cylinder(r=1.9,h=10);
	}
}}