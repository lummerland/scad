firstPart = "//SEIBERT";
secondPart = "/MEDIA";
font = "DejaVu Sans Condensed";
size = 7;

module chip() {
    difference(){
        cylinder(2, 23, 23, true, $fn=180);
        translate([0,0,1.2]) cylinder(1, 22, 22, true, $fn=180);
        translate([0,0,-1.2]) cylinder(1, 22, 22, true, $fn=180);
    }
}

module chip1() {
    difference() {
        chip();
        translate([0,1,0.2]) {
            linear_extrude(height = 1) {
                text(firstPart, font = font, halign="center", valign="center", size=size);
            }
        }; 
    }
}
 
difference() {
    chip1();
    translate([0,-9,0.2]) {
        linear_extrude(height = 1) {
            text(secondPart, font = font, halign="center", valign="center", size=size);
        }
    };
}