// 3d text only works in version 2015.3 and later.

firstPart = "//SEIBERT";
secondPart = "/MEDIA";
font = "DejaVu Sans Condensed";
size = 3;

engravingDepth = 0.3; // [0.1:1]
chipDiameter = 23.25;
chipHeight = 2.30;

module engraving() {
    translate([0, 1, engravingDepth]) {
        linear_extrude(height = 1) {
            text(firstPart, font = font, halign="center", valign="center", size=size);
        }
    };
    translate([0, -3.5, engravingDepth]) {
        linear_extrude(height = 1) {
            text(secondPart, font = font, halign="center", valign="center", size=size);
        }
    }
}

module chip() {
    difference(){
        cylinder(d = chipDiameter, h = chipHeight, center = true, $fn=180);
        translate([0,0,1.2]) cylinder(d = chipDiameter-2, h = 0.5, center = true, $fn=360);
//        translate([0,0,-1.2]) cylinder(1, 22, 22, true, $fn=360);
    }
}

module main() {
    difference() {
        chip();
        engraving();
    }
}

main();
