use <MCAD/boxes.scad>

//Size of the object to be encased
$objectWidth = 90;
$objectHeight = 60;
$objectDepth = 30;

//Case parameters
$caseThick = 2;
$edgeThick = 2;
$xEdgeSize = 4;
$yEdgeSize = 4;
$rounding = 4;

difference(){
roundedBox([$objectWidth + $caseThick * 2,
$objectHeight + $caseThick * 2,
$objectDepth + $caseThick * 2], radius=$rounding);

cube([$objectWidth,
$objectHeight,
$objectDepth], center=true);

translate([0, 0, $objectDepth/2 + $caseThick])
cube([$objectWidth - $xEdgeSize*2,
$objectHeight - $yEdgeSize*2,
$edgeThick * 2 + 0.1], center=true);
} //We add a small amount of extra space to fix coplanar boolean issues. 

