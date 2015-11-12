/*
 * atreus_bluetooth
 * Copyright (C) 2015 cy384
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.

 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

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

