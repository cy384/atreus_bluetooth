atreus bluetooth layer
======================
This project contains some OpenSCAD code to mount a [Handheld Scientific bluetooth adapter](http://handheldsci.com/kb) into an [Atreus keyboard](https://github.com/technomancy/atreus).  Instructions will be general and informal as a degree of adaptability and experience with code and electronics is necessary.

![a completed bluetooth atreus](http://i.imgur.com/ouRLRsS.jpg)

parts
-----
* 3D printed bluetooth layer (see below)
* a USB cable to cannibalize or fine wire to solder directly to your MCU board
* ~26 AWG solid core wire (I got mine from a dead ethernet cable)
* a momentary NO switch (lower profile the better)
* kapton or other insulating tape (used as a precaution, may not be strictly necessary)
* screws long enough to accomodate the increased height (I used nylon ones so I could easily trim the sizes)
* Handheld Scientific bluetooth adapter
* an Atreus keyboard (duh)

atreus case files
-----------------
First, determine if your Atreus was lasercut using the DXF files or the OpenSCAD files.  If you don't know, you've probably got the DXF version, which is much flatter on the bottom.  You'll need to download the official Atreus case files and stick them in this folder (these versions specifically, others may not work or may need fiddling):

* [dxf case file](https://raw.githubusercontent.com/technomancy/atreus/8265b8b4ec5009b76b64a85f10cbe4a14c40515d/case/dxf/case.dxf)
* [openscad case file](https://raw.githubusercontent.com/technomancy/atreus/8265b8b4ec5009b76b64a85f10cbe4a14c40515d/case/openscad/atreus_case.scad)

If you have a DXF case, you'll need to edit the file before OpenSCAD can use it.

* open `case.dxf` in [Inkscape](https://inkscape.org/)
* select everything
* Extensions > Modify Path > Flatten Beziers
* set Flatness to 0.1, hit apply, save

Now open `atreus_bluetooth.scad` and make sure the case version you aren't using is commented out at the top of the file, and the version you want to use is not commented out (`atreus_case.scad` for OpenSCAD, `atreus_dxf_case.scad` for DXF).

printing
--------
You can print it yourself, or you can buy the part you need on Shapeways ([DXF case version](http://www.shapeways.com/product/6C3B7ECJP/atreus-bluetooth-dxf-version) or [OpenSCAD case version](http://www.shapeways.com/product/MCNK779ES/atreus-bluetooth-openscad-version)).  To print it yourself, prepare the files as noted above, render, and export as STL.  If you have a smaller printer, you can comment out three of the last four lines of `atreus_bluetooth.scad` to split it into quarters.

disassembly
-----------

![desolder stuff](http://i.imgur.com/4dY4Uno.jpg)

To get everything to fit inside an Atreus nicely, you'll need to desolder various parts off of the bluetooth PCB.  I removed:

* the LEDs (annoying)
* the buzzer (super annoying)
* the PS2 port
* the full size USB port (not the USB mini one)
* the battery terminal
* the button

assembly
--------

![battery wiring](http://i.imgur.com/Sn5VZkC.jpg)

* Strip one end of some wire, then loop it through the holes on the battery side (leave it long enough to reach over to where the bluetooth PCB will be on top, trim the bottom so it will fit flush).  you'll want to do the outer two contacts (the middle one is NC).

![solder points](http://i.imgur.com/CJ3scSH.jpg)

* Solder the battery wires to the appropriate points on the bluetooth PCB
* Make a hole suitable for the switch you've chosen and mount it wherever you can get it to fit nicely (I chose the bottom, used a drill press to make the hole, and stuck it in place with some hot glue)
* Wire the switch to the appropriate points on the PCB (not polarity-sensitive)
* Cut your USB cable and strip the insulation, test if it can bend with a short enough radius to reach from your MCU board over to the bluetooth PCB.  If not, you'll need to solder directly to the USB pads on your MCU board (good luck, hope you've got some fine wire and skillz).
* Solder the USB wires to the appropriate points on the PCB
* Push in the battery and PCB (should friction fit okay)
* Test that everything works, tape up anything you're worried about shorting, and reassemble your keyboard.

![finished bluetooth layer](http://i.imgur.com/qP7fzlL.jpg)

miscellaneous notes
-------------------
* For some reason this bluetooth adapter [won't work with the simple Atreus firmware](https://github.com/technomancy/atreus-firmware/issues/33), so I'm using [the TMK firmware](https://github.com/technomancy/tmk_keyboard/tree/atreus) instead.
* This bluetooth adapter has a mechanism for lowering the automatic poweroff time, considering doing so ([read the manual for details](http://handheldsci.com/wp/wp-content/uploads/User_Manual_v2.0.pdf)).
* [LiPo batteries catch fire/explode if you heat them up too much or poke them with sharp objects, don't be stupid.](https://www.youtube.com/watch?v=7-xPHopebiE)
* Make sure your bluetooth adapter has the same PCB as I used, otherwise you'll need to figure out the wiring on your own (mine says "KB v34", really, you should check my work with a multimeter to be safe anyway).
* I've only printed the OpenSCAD case version of this project, the DXF version is (conservative and probably correct) conjecture.

license
-------
This project is licensed under the terms of version three of the GPL (GPLv3), see `LICENSE` file for details.  Comments, contributions, and bug reports are welcomed.