include <m2_5/m2_5.scad>
include <rect/rect.scad>
include <voronDinRail/voronDinRail.scad>

module zero4uMount_Column() {
    let(usbZ=7, frameZ=4, colZ=usbZ+frameZ) {
        difference() {
            cylinder(h=colZ, d=6, $fn=25);
            
            translate([0,0,colZ-4.2])
                m2_5_ThreadedInsert();
        }
    }
}

module zero4uMount_HolePattern(center=false) {
    translate([center?58/-2:0,center?23/-2:0]) {
        for (x = [0:58:58]) {
            for (y = [0:23:23]) {
                translate([x,y,0])
                    children();
            }
        }
    }
}

module zero4uMount_base() {
    let(colR=3, colD=colR*2, baseX=58, baseY=23+colR*2, dinX=31.2) {
       linear_extrude(4) difference() {
            square([baseX,baseY], center=true);
            
            rect_rounded([dinX-colD-1,baseY-colD*2],3, center=true);
            
            translate([baseX/2,0,0])
                rect_rounded([(baseX-dinX)-colD-1,baseY-colD*2],3, center=true);

            translate([baseX/-2,0,0])
                rect_rounded([(baseX-dinX)-colD-1,baseY-colD*2],3, center=true);
        }
    }
}

module zero4uMount() {
    union() {
        zero4uMount_HolePattern(center=true)
            zero4uMount_Column();
        
        difference() {
            zero4uMount_base();
            
            voronDinRail_HolePattern(center=true);
        }
    }
}
