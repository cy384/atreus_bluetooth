// fudge factor to match up with the openscad case
spacer_quartering_offset = 58.25;

module spacer()
{
	translate([0, 60, 0])
	intersection()
	{
		import (file = "case.dxf", layer = "0");
		translate([0,-110,0]) square([400, 200], center=true);
	}
}

module spacer_quadrant(spacer_quadrant_number)
{
	translate([0, spacer_quartering_offset])
	{
		intersection()
		{
			translate([0, 0]) { spacer(); }
			rotate([0, 0, spacer_quadrant_number * 90]) { square([1000, 1000]); }
		}
	}
}

spacer();