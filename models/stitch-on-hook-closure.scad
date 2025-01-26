$num_hooks = 5;
$hook_thick = 10;
$hook_tall = 20;
$hook_size = 15;
$working_width = 90;
$base_wide = 25;
$base_thick = 1.5;
$needle_width = 3.5;
$needle_gap = 2;
$sewing_hole_region = $base_wide-$hook_thick;
$sewing_hole_x_adjustment = $sewing_hole_region + ($sewing_hole_region-$needle_width)/2;

$peg_hole_size = sqrt(2*$hook_thick*$hook_thick); //the maximum width of a 45 degree cross section of the peg. 

$space_without_hooks = $working_width - ($num_hooks*$hook_thick);

$space_between_hooks = $space_without_hooks / ($num_hooks - 1);

module make_sewing_hole(){
    translate([0,0,-0.05])
    cylinder(h=$base_thick + 1.1, r=$needle_width/2);
};

module make_holepeg (){
    cylinder(r=$hook_thick/2*1.5, h=$hook_size);
};

module make_hook(size_off, size_hook, thick, b_thick) {
    difference(){
        union(){
            cylinder(r=thick/2, h=size_off);
            translate([0,0,size_off])
            sphere(r=thick/2);
            translate([0,0,size_off])
            rotate([0,90,0])
            cylinder(r=thick/2, h=size_hook);
        };
        translate([0,-thick/2,size_off])
        rotate([0,315,0])
        translate([-thick,0,0])
        cube(thick*2);
    }
};

union(){
    difference(){
        cube([$base_wide, $working_width + $hook_thick, $base_thick]);
        for (i = [0:$working_width/($needle_width+$needle_gap)]){
            translate([$sewing_hole_x_adjustment, $hook_thick/2 + i*$needle_width + i*$needle_gap])
            make_sewing_hole();
        };
    }

    for (i = [0:$num_hooks-1]){
        translate([0, i*$space_between_hooks + i*$hook_thick + $hook_thick , 0])
        make_hook($hook_tall, $hook_size, $hook_thick, $base_thick);
    };
};

    translate([$base_wide*2, 0, 0])
difference(){
    cube([$base_wide + $sewing_hole_region, $working_width + $hook_thick, $base_thick]);
        for (i = [0:$working_width/($needle_width+$needle_gap)]){
            translate([$base_wide + $sewing_hole_region/2, $hook_thick/2 + i*$needle_width + i*$needle_gap])
            make_sewing_hole();
        };
 
    for (i = [0:$num_hooks-1]){
        
    translate([$base_wide - $peg_hole_size, i*$space_between_hooks + i*$hook_thick + $hook_thick, -0.05])
    make_holepeg();
};

    
};