01_Main_Dim = 108.2;
02_Width = 6;
03_Height = 15;
04_Slot_Width = 3;
05_Slot_Depth = 9;
06_Clearance = 0.1;
BigNum = 9999;
SmallNum = .01;
Slot_x = (02_Width-04_Slot_Width-06_Clearance*2)/2;

Text_Height = 10;
Text_Thick = 15;

difference()
	{
	
    // Main body
        cube([ 02_Width, 01_Main_Dim, 03_Height]);
	
        translate([Slot_x, -SmallNum, 03_Height-05_Slot_Depth])
		cube([04_Slot_Width+06_Clearance*2, BigNum, BigNum]);
        
	
	}

