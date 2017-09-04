fanR = 19;
squareW = 40;
gasketH = 0.8;
boltOffset = 4;
boltR = 3.5/2;
$fs = 0.1;

boltPos = [boltOffset, squareW-boltOffset];

bigNum = 9999;
smallNum = 0.001;


difference(){
    cube([squareW, squareW, gasketH]);
    translate([squareW/2, squareW/2,-smallNum])cylinder(r=fanR,h=bigNum);
    for (x=[0 : 1 : 1]){
        for (y=[0 : 1 : 1]){
            translate([boltPos[x], boltPos[y], -smallNum]) cylinder(r=boltR, h = bigNum);
        }
    }
    
}

