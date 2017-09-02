include <dependencies/parametric_involute_gear_v5.0.scad>
//small gear was 9tooth, 200pitch
//large gear was 53tooth, 200pitch

//small gear was 9tooth, 260pitch
//large gear was 39tooth, 260pitch



translate([5,0,0])
	large_gear();


module large_gear(){
translate ([34.667,0,0]) difference(){
	gear (
	number_of_teeth=53,
	circular_pitch=200, diametral_pitch=false,
	pressure_angle=28,
	clearance = 0.2,
	gear_thickness=5,
	rim_thickness=6,
	rim_width=3,
	hub_thickness=12,
	hub_diameter=18,
	bore_diameter=6.3,
	circles=6,
	backlash=0,
	twist=0,
	involute_facets=0);
	translate([0,0,9.8]) cylinder(h=6, r=10.3/sqrt(3),$fn=6,center=true);
}}
