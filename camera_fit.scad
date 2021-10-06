include </home/andre/OpenScad/libraries/threads.scad>

tubeind = 38;
tubeoutd = 45;
tol = 0.1;

dist = 5; 
depth = 4.0; // depth of threads
threadL = 8;
threadD = 5;

module thread_fit(){
union(){
    translate([0,0,-threadL+1]){
difference(){
    union(){
        translate([0,0,-threadL+1]){
        metric_thread (diameter=25.4, pitch=32/25.4, length=threadL);   
        }//end translate
    cylinder(d2=tubeoutd-2*tol,d1=26.4,h=10);
    }//end union
    //english_thread (0.99, 32, threadL/25.4);
    
    union(){
        translate([0,0,-threadL]){
        cylinder(d=25.4-4,h=threadL+2);
            }//end translate
        translate([0,0,-1]){
cylinder(d2=tubeoutd-2*tol-2,d1=21.4,h=12);
}//end translate
}//end union



    }//end difference
}//end translate


}//
}//end module



difference(){
union(){
cylinder(d=tubeoutd-2*tol,h=10);

    cylinder(d=tubeind,h=30);
}//end union
    translate([0,0,-1]){
        cylinder(d=tubeind-2-2*tol,h=52);
    }//end translate
}//end difference

translate([0,0,-threadL/2+1]){
    thread_fit();

}//end translate
