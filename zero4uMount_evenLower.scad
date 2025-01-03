include <m2_5/m2_5.scad>

module zero4uMount_Column(frameZ=1) {
    let(usbZ=7, colZ=usbZ+frameZ) {
        difference() {
            cylinder(h=colZ, d=6, $fn=25);
            
            translate([0,0,colZ-4.2])
                m2_5_ThreadedInsert();
        }
    }
}

module zero4uMount_evenLowerHolePattern(center=false) {
    translate([center?58/-2:0,0]) {
        for (x = [0:58:58]) {
            translate([x,0,0])
                children();
        }
    }
}

module zero4uMount_evenLowerOutline() {
    let(usbY=7, frameY=1, colY=usbY+frameY,dinY=35.4) {
        polygon([
            [0,0],
            [0,colY],
            [3,colY],
            [3,frameY],
            [64-3,frameY],
            [64-3,colY],
            [64,colY],
            // lever
            [64+5.8+10,colY],
            [64+5.8+12,colY-2],
            [64+5.8+12,colY-4],
            [64+5.8+10,colY-6],
            [64+4.8,colY-6],
            //clip
            [64+1,-3.4],
            [64-1,-3.4],
            [64-1,-2.6],
            [64.6,-1.2],
            [64.6,colY-4],
            [64.6+5.8,colY-2],
            [64.6+5.8,colY-1.6],
            [64.6,colY-1.6],
            [64,colY-1.6],
            // Pin
            [64,0],
            [64-dinY+1,0],
            [64-dinY+1,-1.2],
            [64-dinY+1+3,-2.6],
            [64-dinY+1+3,-3.4],
            [64-dinY-1,-3.4],
            [3,-3.4],
            [0,-1.2],
        ]);
    }
}

module zero4uMount_evenLower() {
    let(usbZ=7, frameZ=1, colZ=usbZ+frameZ) {
        union() {
            translate([3,-3,0])
                zero4uMount_evenLowerHolePattern(center=false)
                    zero4uMount_Column(frameZ);

            difference() {
                rotate([90,0,0])
                    linear_extrude(6)
                        zero4uMount_evenLowerOutline();
                
                translate([3,-3,0])
                    zero4uMount_evenLowerHolePattern(center=false)
                        cylinder(h=colZ, d=6, $fn=25);
            }
        }
    }
}
