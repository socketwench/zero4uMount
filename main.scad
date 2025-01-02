include <zero4uMount.scad>

Select = 0; // [0:VoronDinClip, 1:lowProfileClip]

if (Select == 0) {
    zero4uMount();
}
else if (Select == 1) {
    zero4uMount_lowProfile();
}