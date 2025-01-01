module m2_5_ThreadedInsert() {
    cylinder(h=4.2, d=3.6, $fn=25);
}

module m2_5_mountingHole() {
    union() {
        translate([0,0,2])
            cylinder(h=2, d=4, $fn=25);

        cylinder(h=4, d=2.6, $fn=25); 
    }
}
