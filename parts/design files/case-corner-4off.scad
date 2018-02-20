01_Main_Dim = 120;
02_Width = 6;
03_Height = 15;
04_Slot_Width = 3;
05_Slot_Depth = 9;
06_Clearance = 0.1;
echo(07_OutsideDim);
BigNum = 9999;
SmallNum = .01;
Slot_x = (02_Width-04_Slot_Width-06_Clearance*2)/2;
07_OutsideDim = 01_Main_Dim + Slot_x;

Text_Height = 10;
Text_Thick = 15;

difference()
	{
	
    // Main body
        cube([07_OutsideDim, 07_OutsideDim, 03_Height]);
	// Remove central portion
        translate([02_Width,-SmallNum,-SmallNum])	
		cube([BigNum, 07_OutsideDim-02_Width+SmallNum, BigNum]);
	
        translate([Slot_x, -SmallNum, 03_Height-05_Slot_Depth])
		cube([04_Slot_Width+06_Clearance*2, 01_Main_Dim+SmallNum, BigNum]);
        
	translate([Slot_x, 07_OutsideDim-Slot_x-(04_Slot_Width+06_Clearance*2), 03_Height-05_Slot_Depth])
		cube([BigNum, 04_Slot_Width+06_Clearance*2, BigNum]);
        
	
	}

