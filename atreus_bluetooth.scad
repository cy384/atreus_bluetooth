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

// pick one of these according to your case type (dxf or openscad)
use <atreus_case.scad>;
//use <atreus_dxf_quarters.scad>;

// how tall to make everything, 6.90 is advised
blue_z = 6.90;

// radius of the pins for mounting the bluetooth pcb
mount_d = 3;

// set to an arbitrary high number to make round things nicely round
$fn = 20;

use <bp-6m_battery_holder.scad>;

module faceplate()
{
	difference()
	{
		translate([0, 0, -2.25]) cube([2, 45.3, blue_z], center=true);
		translate([0, 7, -1]) cube([2.5, 8.5, blue_z - 0.5], center=true);
	}
}

module bluetooth_mount()
{
	for (i = [30.25, -29], j = [19.125, -19.125])
	{
		translate([abs(i), 0, 0]) cube([mount_d+2, j*2+mount_d+4, 1], center=true);
		translate([0, j, 0]) cube([i*2+mount_d+2, mount_d+4, 1], center=true);
		translate([-29, j, 0]) cylinder(h=blue_z, d=mount_d);
	}

	translate([31.75, 0, 5.2]) faceplate();
}

module bluetooth_mount_cutout()
{
	hull()
	{
		for (i = [30.25, -29], j = [19.125, -19.125])
		{
			translate([abs(i), 0, (blue_z/2)]) cube([mount_d+2, j*2+mount_d+4, blue_z+1], center=true);
			translate([0, j, (blue_z/2)]) cube([i*2+mount_d+2, mount_d+4, blue_z+1], center=true);
		}
	}
}

module bluetooth_side()
{
	difference()
	{
		linear_extrude(height = blue_z, center = true, convexity = 10) spacer_quadrant(1);
		translate([-60, 75.5, -blue_z/2 + 0.5]) rotate([0, 0, 90]) bluetooth_mount_cutout();
	}

	translate([-60, 75.5, -blue_z/2 + 0.5]) rotate([0, 0, 90]) bluetooth_mount();
}

module battery_side()
{
	linear_extrude(height = blue_z, center = true, convexity = 10)
	spacer_quadrant(0);
	translate([70, 76.5, -0.1]) battery_holder();
}


battery_side();
bluetooth_side();
linear_extrude(height=blue_z, center=true, convexity=10) spacer_quadrant(2);
linear_extrude(height=blue_z, center=true, convexity=10) spacer_quadrant(3);

