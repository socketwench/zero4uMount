module voronDinRail_HolePattern(center=false) {
    let(distance=31.4) {
        translate([center ? distance/-2 : 0, 0])
        union() {
             children();
            
            translate([distance, 0, 0])
                children();
        }
    }
}
