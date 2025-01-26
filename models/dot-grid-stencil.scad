$fn = 10;
n = 15; // Number of dots in the grid
size = (n - 1) * 5;

module dot() {
    cylinder(r=1, h=10);
}


difference(){
    cube([size, size, 2.5]);
    for (x = [0 : n-1]) {
        for (y = [0 : n-1]) {
            translate([x*5, y*5, -0.1]) dot(); 
        }
    }
};