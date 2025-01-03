include <zero4uMount.scad>
include <zero4uMount_evenLower.scad>

Select = 0; // [0:VoronDinClip, 1:lowProfileClip, 2:evenLowerClip]

if (Select == 0) {
    zero4uMount();
}
else if (Select == 1) {
    zero4uMount_lowProfile();
}
else if (Select == 2) {
    zero4uMount_evenLower();
}