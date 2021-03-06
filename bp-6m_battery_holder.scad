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

// size of battery
// fudge these until you get a nice friction fit
batt_x = 40.65;
batt_y = 41.15;
batt_z = 06.30;

// thickness of perimeter wall
perimeter = 2;

// where to put the contacts
contact_location = [-((batt_x + 6)/2), -6.5, 0];

module holder_body()
{
	difference()
	{
		cube([batt_x + perimeter*2, batt_y + perimeter*2, batt_z], center=true);
		cube([batt_x, batt_y, batt_z], center=true);
	}
}

module contact()
{
	difference()
	{
		cube([6, 3, batt_z], center=true);
		translate([2.5, 0, 0]) cube([1, 1, batt_z], center=true);
		translate([-0.5, 0, 0]) cube([3, 1, batt_z], center=true);

		for (i= [-1, 1])
		{
			translate([2, 0, i*batt_z/2]) cube([2, 1, 2], center=true);
		}
	}
	
	translate([2.5, 0, 0]) cube([2.5, 1, 0.6], center=true);
}

module contact_block()
{
	c1 = -4;
	c2 = 0;
	c3 = +4;

	difference()
	{
		cube([6, (c3 - c1) + 2, batt_z], center=true);

		for (i = [c1, c2, c3])
		{
			translate([0, i, 0]) hull() contact();
		}
	}

	for (i = [c1, c2, c3])
	{
		translate([0, i, 0]) contact();
	}
}

module battery_holder()
{
	difference()
	{
		holder_body();
		translate(contact_location) hull() contact_block();
	}

	translate(contact_location) contact_block();
}

battery_holder();

