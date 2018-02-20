big = 999;
small = 0.01;

01_width = 70;
02_height = 150;
03_skew = 70*.75;
04_diameter = 27;
05_thick = 15;
06_shaft_depth = 27;
07_skew_angle = atan(03_skew / (02_height+06_shaft_depth));

08_perspex_thick = 3;

09_block_height = 25;
10_clearance = .15;
11_bolt_cap = 6;
12_bolt_diam = 3.5;
13_bolt_offset = 10;
14_bolt_cap_height = 10;

module spool_holder_top(){
    color( "red", 1)
    translate([0, 02_height, 0])
    difference(){
    rotate([0,0,07_skew_angle]){
        difference() {
            union() {
                cylinder(r=01_width/2, h=05_thick + 08_perspex_thick);
                translate([-01_width/2,0,0]) cube([01_width, big/2, 05_thick + 08_perspex_thick]);
            }
            
            translate([0,0,-small]) cylinder(r=04_diameter/2, h=big+small*2);
            translate([-04_diameter/2-small,0,-small]) cube([04_diameter+small*2, big, big+small*2]);
            translate([-01_width/2,0, 05_thick-10_clearance]) 
                        // Cut outs for perspex
                        difference(){
                    translate([-small,-big/2,0]) cube([01_width+2*small, big, big]);
                    translate([-04_diameter/2+01_width/2+10_clearance ,-big/2,-small]) cube([04_diameter-2*10_clearance , big, big+2*small]);
                    }
        }
    }
    translate([-big/2, 06_shaft_depth,-small]) cube([big,big,05_thick+2*small]);
    }
}

module spool_holder_bottom(){

    color( "red", 1)
    difference(){
        translate([02_height * sin(07_skew_angle)-01_width/2, 0, 0])
        difference() {
            rotate([0,0,07_skew_angle]){
                
                    difference(){
                        translate([0,-big/2,0]) cube([01_width, big, 05_thick + 08_perspex_thick]);
                    
                    translate([0,0, 05_thick-10_clearance]) 
                        // Cut outs for perspex
                        difference(){
                    translate([-small,-big/2,0]) cube([01_width+2*small, big, big]);
                    translate([-04_diameter/2+01_width/2+10_clearance ,-big/2,-small]) cube([04_diameter-2*10_clearance , big, big+2*small]);
                    }
                }
            }
            
            translate([13_bolt_offset,0,0]) union(){
                translate([0, -small, 05_thick/2]) rotate([-90,0,0]) cylinder(r=12_bolt_diam/2, h = big);
                translate([0, 14_bolt_cap_height, 05_thick/2]) rotate([-90,0,0]) cylinder(r=11_bolt_cap/2, h = big);
            }
            translate([01_width/2,0,0]) union(){
                translate([0, -small, 05_thick/2]) rotate([-90,0,0]) cylinder(r=12_bolt_diam/2, h = big);
                translate([0, 14_bolt_cap_height, 05_thick/2]) rotate([-90,0,0]) cylinder(r=11_bolt_cap/2, h = big);
            }
            translate([01_width-13_bolt_offset,0,0]) union(){
                translate([0, -small, 05_thick/2]) rotate([-90,0,0]) cylinder(r=12_bolt_diam/2, h = big);
                translate([0, 14_bolt_cap_height, 05_thick/2]) rotate([-90,0,0]) cylinder(r=11_bolt_cap/2, h = big);
            }
            

       
        }

        translate([-big/2,09_block_height, -big/2]) cube([big, big, big]);
        translate([-big/2,-big, -big/2]) cube([big, big, big]);
    }
}

module spool_holder_perspex(){
    color( "lightcyan", 0.5)
    translate([0, 02_height, 0]) union(){

        translate([0,0,-08_perspex_thick]) difference(){
            rotate([0,0,07_skew_angle]){
                translate([-01_width/2,-big/2,0]) cube([01_width, big, 08_perspex_thick]);
            }
            translate([-big/2, 06_shaft_depth,-big/2]) cube([big,big,big]);
            translate([-big/2, -02_height-big,-big/2]) cube([big,big,big]);   
        }

        translate([0,0,05_thick]) difference(){
            rotate([0,0,07_skew_angle]){
                difference(){
                    translate([-01_width/2,-big/2,0]) cube([01_width, big, 08_perspex_thick]);
                    translate([-04_diameter/2,-big/2,-small]) cube([04_diameter, big, 08_perspex_thick+2*small]);
                }
                
            }
            translate([-big/2, 06_shaft_depth,-big/2]) cube([big,big,big]);
            translate([-big/2, -02_height-big,-big/2]) cube([big,big,big]);   
        }
    }
}
