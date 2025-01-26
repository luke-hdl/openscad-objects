// Define the diameter and number of sections for each radial section
$diameter = 100;
$num_sections1 = 2;  // Sections at the center
$num_sections2 = 8;  // Sections on the outside

// Calculate the radius
$radius = $diameter/2;

// Function to rotate and position text objects
module rotate_and_position(text, text_size, angle, x, depth_multiplier){
  rotate(angle)
  translate([x, 0, 0])
  rotate([0,180,270])
  scale([1, 1, depth_multiplier])
  text(text, size = text_size, halign = "center", valign = "center");
};

module make_radial(section_count, radial_placement, text_size, depth_multiplier){
    for (i = [0: section_count-1]){
          // Calculate the angle for each section
          $angle = (i * 360) / (section_count);
          $edge_angle = $angle - (180/section_count);

          // Define text for each section
          $text = str(i + 1);

          // Position text on the rim using the function with a smaller radius
          rotate_and_position($text, text_size, $angle, 0 + radial_placement, depth_multiplier);
          rotate_and_position("|", text_size, $edge_angle, 0 + radial_placement, depth_multiplier);
    }
}

module make_ring( depth, centered_at, width){
    translate([0,0,-0.05])
    difference(){
        cylinder(h = depth, r=centered_at + width/2);
        cylinder(h = depth, r=centered_at - width/2);
    };
}

difference(){
    cylinder(r = $radius, h = 4);
    make_ring(3, $radius/4*0.5, 1);
    make_radial(6, $radius/4, $radius/6, 3);
    make_ring(3, $radius/4*1.5, 1);
    make_radial(10, $radius/4*2, $radius/6, 3);
    make_ring(3, $radius/4*2.5, 1);
    make_radial(20, $radius/4*3, $radius/8, 4);
    make_ring(3, $radius/4*3.5, 1);
};

translate([0,-125,0])
difference(){
    cylinder(r = $radius, h = 4);
    make_ring(3, $radius/4*0.5, 1);
    make_radial(3, $radius/4, $radius/6, 3);
    make_ring(3, $radius/4*1.5, 1);
    make_radial(8, $radius/4*2, $radius/6, 3);
    make_ring(3, $radius/4*2.5, 1);
    make_radial(12, $radius/4*3, $radius/6, 4);
    make_ring(3, $radius/4*3.5, 1);
};