$holeRadius = 2.5;
$tabletSize = 40;
$holeDistFromEdge = 5;
$tabletThick = 5;

difference(){
    cube([$tabletSize, $tabletSize, $tabletThick], false);
    translate ([$holeDistFromEdge, $holeDistFromEdge, -0.01])
        cylinder(r=$holeRadius, h=$tabletThick + 0.02);
    
    translate ([$tabletSize - $holeDistFromEdge, $holeDistFromEdge, -0.01])
    cylinder(r=$holeRadius, h=$tabletThick + 0.05);
    
    translate ([$tabletSize - $holeDistFromEdge, $tabletSize - $holeDistFromEdge, -0.01])
    cylinder(r=$holeRadius, h=$tabletThick + 0.05);
    
    translate ([$holeDistFromEdge, $tabletSize - $holeDistFromEdge, -0.01])
    cylinder(r=$holeRadius, h=$tabletThick + 0.05);
}
