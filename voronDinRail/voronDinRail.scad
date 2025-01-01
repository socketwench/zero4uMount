module voronDinRail_HolePattern(center=false) {
    let(distance=31.4) {
        translate([center ? distance/-2 : 0, 0])
        union() {
             m2_5_mountingHole();
            
            translate([distance, 0, 0])
                m2_5_mountingHole();
        }
    }
}
