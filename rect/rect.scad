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
