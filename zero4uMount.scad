module m2_5_ThreadedInsert() {
    cylinder(h=4.2, d=3.6, $fn=25);
}

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

module rect_rounded(size, radius, center=false) {
    let(rectW=size[0], rectH=size[1]) {
        translate([center ? size[0]/-2 : 0, center ? size[1]/-2 : 0]) 
            hull() {
                translate([radius, radius])
                    circle(r=radius, $fn=25);

                translate([rectW-radius, radius])
                    circle(r=radius, $fn=25);

                translate([radius, rectH-radius])
                    circle(r=radius, $fn=25);

                translate([rectW-radius, rectH-radius])
                    circle(r=radius, $fn=25);
            }
    }
}

module m2_5_mountingHole() {
    union() {
        translate([0,0,2])
            cylinder(h=2, d=4, $fn=25);

        cylinder(h=4, d=2.6, $fn=25); 
    }
}

module zero4uMount_voronDinRailHolePattern(center=false) {
    let(distance=31.4) {
        translate([center ? distance/-2 : 0, 0])
        union() {
             m2_5_mountingHole();
            
            translate([distance, 0, 0])
                m2_5_mountingHole();
        }
    }
}

module zero4uMount_base() {
    let(colR=3, colD=colR*2, baseX=58, baseY=23+colR*2, dinX=31.2) {
       linear_extrude(4) difference() {
            square([baseX,baseY], center=true);
            
            rect_rounded([dinX-colD,baseY-colD*2],3, center=true);
            
            translate([baseX/2,0,0])
                rect_rounded([(baseX-dinX)-colD,baseY-colD*2],3, center=true);

            translate([baseX/-2,0,0])
                rect_rounded([(baseX-dinX)-colD,baseY-colD*2],3, center=true);
        }
    }
}

module zero4uMount() {
    union() {
        zero4uMount_HolePattern(center=true)
            zero4uMount_Column();
        
        difference() {
            zero4uMount_base();
            
            zero4uMount_voronDinRailHolePattern(center=true);
        }
    }
}

zero4uMount();