// 3d text only works in version 2015.3 and later.

font = "DejaVu Sans Condensed";
size = 13;

engravingDepth = 0.3; // [0.1:1]
chipDiameter = 23.25;
chipHeight = 2.30;

module engraving() {
    translate([0, 0, -(chipHeight/2)]) {
        linear_extrude(height = 3) {
            text("//", font = font, halign="center", valign="center", size=size);
        }
    }
}

module chip() {
    difference(){
        cylinder(d = chipDiameter, h = chipHeight, center = true, $fn=180);
        translate([0,0,1.2]) cylinder(d = chipDiameter-2, h = 0.5, center = true, $fn=360);
    }
}

module main() {
    difference() {
        chip();
        engraving();
    }
}

main();
