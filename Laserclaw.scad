//2020-09-16
//Laserclaw.scad
//https://github.com/degenerator0/
//https://www.instructables.com/member/degenerator0/
//https://www.thingiverse.com/degenerator/
//Laser diode chassis for Laserclaw project


$fs=.01;
LASERADJUST=2;
M1BOTTOMADJUST_X=3.6;
M1BOTTOMADJUST_Y=-.4;
BOTTOMCIRCLE=10;
BOTTOMCIRCLEADJUST=-13;
EDGECIRCLE=1;
POLYGON_X=3.6;
POLYGON_Y=6.5;
TRAPEZOID_X=11;
TRAPEZOID_Y=-8;
TOPCIRCLE=POLYGON_Y/2+.8;
TOPCIRCLEADJUST=POLYGON_Y/4+1.8;
FRONT_H=16;


module laserfront (){
    hole0_d=3.8;
    hole1_d=3.8;
    hole2_d=6.5;
    screwhead_d=3.8;
    segment0_h=2;
    segment1_h=2;
    segment2_h=12;
    total_h=segment0_h+segment1_h+segment2_h;
    strap_x=2.4;
    strap_y=2.4;
    strap_z=2.2;
    
    union () {
        //segment0
        translate ([0,0,segment1_h+segment2_h])
            linear_extrude(height = segment0_h) {
                difference (){
                    union () {
                        
                        //rounded top
                        translate ([0,2*TOPCIRCLE-TOPCIRCLEADJUST]) circle (TOPCIRCLE);
                        
                        //trapezoid base
                        polygon ([
                            [-POLYGON_X,POLYGON_Y],
                            [POLYGON_X,POLYGON_Y],
                            [TRAPEZOID_X, TRAPEZOID_Y],
                            [-TRAPEZOID_X, TRAPEZOID_Y]]);  
                    
                        }
                        
                //cutouts
                    //laser module hole
                    translate ([0,LASERADJUST*TOPCIRCLE/2]) circle (hole0_d/2);
                        
                    //finger curvature
                    translate ([0,BOTTOMCIRCLEADJUST]) circle (BOTTOMCIRCLE);
                    
                    //m2 screwhead - left
                    translate ([-M1BOTTOMADJUST_X,M1BOTTOMADJUST_Y]) circle(screwhead_d/2);
                        
                    //m2 screwhead - right
                    translate ([M1BOTTOMADJUST_X,M1BOTTOMADJUST_Y]) circle(screwhead_d/2);
                }
            }   
        //segment 1
        translate ([0,0,segment2_h])
            linear_extrude(height = segment1_h) {
                difference (){
                    union () {
                        
                        //rounded top
                        translate ([0,2*TOPCIRCLE-TOPCIRCLEADJUST]) circle (TOPCIRCLE);
                        
                        //trapezoid base
                        polygon ([
                            [-POLYGON_X,POLYGON_Y],
                            [POLYGON_X,POLYGON_Y],
                            [TRAPEZOID_X, TRAPEZOID_Y],
                            [-TRAPEZOID_X, TRAPEZOID_Y]]);  
                   
                        }
                //cutouts
                    //laser module hole
                    translate ([0,LASERADJUST*TOPCIRCLE/2]) circle (hole2_d/2);
                    
                    //finger curvature
                    translate ([0,BOTTOMCIRCLEADJUST]) circle (BOTTOMCIRCLE);
                    
                    //m2 screw - left
                    translate ([-M1BOTTOMADJUST_X,M1BOTTOMADJUST_Y]) circle(1);
                    
                    //m2 screw - RIGHT
                    translate ([M1BOTTOMADJUST_X,M1BOTTOMADJUST_Y]) circle(1);
                }
            }   
        //segment 2
        translate ([0,0,0])
            linear_extrude(height = segment2_h) {
                difference (){
                    union () {
                        
                        //rounded top
                        translate ([0,2*TOPCIRCLE-TOPCIRCLEADJUST]) circle (TOPCIRCLE);
                        
                        //trapezoid base
                        polygon ([
                        [-POLYGON_X,POLYGON_Y],
                            [POLYGON_X,POLYGON_Y],
                            [TRAPEZOID_X, TRAPEZOID_Y],
                            [-TRAPEZOID_X, TRAPEZOID_Y]]);  
                   
                        }
                //cutouts
                    //laser module hole
                    translate ([0,LASERADJUST*TOPCIRCLE/2]) circle (hole2_d/2);
                    
                    //finger curvature
                    translate ([0,BOTTOMCIRCLEADJUST]) circle (BOTTOMCIRCLE);
                    
                    //m2 screw - left
                    translate ([-M1BOTTOMADJUST_X,M1BOTTOMADJUST_Y]) circle(1);
                    
                    //m2 screw - RIGHT
                    translate ([M1BOTTOMADJUST_X,M1BOTTOMADJUST_Y]) circle(1);
                }  
            } 
           
        //strap holder0
        translate ([-TRAPEZOID_X,TRAPEZOID_Y-strap_y])
            linear_extrude(height = strap_z) {
                square (size = [strap_x,strap_y]);
            }
            
        translate ([-TRAPEZOID_X,TRAPEZOID_Y-strap_y,total_h-strap_z])
            linear_extrude(height = strap_z) {
                square (size = [strap_x,strap_y]);
            }
            
        translate ([-TRAPEZOID_X+strap_x/2,TRAPEZOID_Y-strap_y])
            linear_extrude(height = total_h) {
              circle (strap_x/2);
                           }   

        //strap holder1
        translate ([TRAPEZOID_X-strap_x,TRAPEZOID_Y-strap_y])
            linear_extrude(height = strap_z) {
                square (size = [strap_x,strap_y]);
            }
            
        translate ([TRAPEZOID_X-strap_x,TRAPEZOID_Y-strap_y,total_h-strap_z])
            linear_extrude(height = strap_z) {
                square (size = [strap_x,strap_y]);
            }
            
        translate ([TRAPEZOID_X-strap_x/2,TRAPEZOID_Y-strap_y])
            linear_extrude(height = total_h) {
                circle (strap_x/2);
            }
            
    }
}

module laserwires (){  
    hole0_d=5;
    hex_d=5.2;
    rectangle_h=3.2;
    rectangle_w=6.2;
    segment0_h=2;
    segment1_h=2;
    segment2_h=2;
    total_h=6;
    strap_x=2.4;
    strap_y=2.4;
    strap_z=2.2;
       
    union () {
        //segment 0
        translate ([0,0,0])
            linear_extrude(height = segment0_h) {
                difference (){
                    union () {
                        //rounded top
                        translate ([0,2*TOPCIRCLE-TOPCIRCLEADJUST]) 
                            circle (TOPCIRCLE);
                        //trapezoid base
                        polygon ([
                            [-POLYGON_X,POLYGON_Y],
                            [POLYGON_X,POLYGON_Y],
                            [TRAPEZOID_X, TRAPEZOID_Y],
                            [-TRAPEZOID_X, TRAPEZOID_Y]]);
                     
                     }
                     
                    //laser module hole
                    translate ([0,LASERADJUST*TOPCIRCLE/2]) 
                        scale([1.3,1])circle (hole0_d/2);
                    //finger curvature
                    translate ([0,BOTTOMCIRCLEADJUST]) 
                        circle (BOTTOMCIRCLE);
       
                    //m2 screw - left
                    translate ([-M1BOTTOMADJUST_X,M1BOTTOMADJUST_Y])
                        rotate ([0,0,18])
                            circle(r=2.6, $fn=6);
                    //m2 screw - RIGHT
                    translate ([M1BOTTOMADJUST_X,M1BOTTOMADJUST_Y]) 
                        rotate ([0,0,-18]) 
                            circle(r=2.6, $fn=6);
    }
            //strain relief
                translate ([0,LASERADJUST*TOPCIRCLE/2]) 
                    square ([rectangle_w+2,1], center=true); 
    
}  
 
    
        //segment 1
        translate ([0,0,segment0_h])
            linear_extrude(height = segment1_h) {    
                difference (){
                    union () {
                        //rounded top
                        translate ([0,2*TOPCIRCLE-TOPCIRCLEADJUST]) 
                            circle (TOPCIRCLE);
                        //trapezoid base
                        polygon ([
                                [-POLYGON_X,POLYGON_Y],
                                [POLYGON_X,POLYGON_Y],
                                [TRAPEZOID_X, TRAPEZOID_Y],
                                [-TRAPEZOID_X, TRAPEZOID_Y]]);  
                      
                    }
                
                    //cutouts
                        //laser module hole
                        translate ([0,LASERADJUST*TOPCIRCLE/2]) 
                            scale([1.3,1])
                                circle (hole0_d/2);
                    
                        //finger curvature
                        translate ([0,BOTTOMCIRCLEADJUST]) 
                            circle (BOTTOMCIRCLE);
                          
                        //m2 screw - left
                        translate ([-M1BOTTOMADJUST_X,M1BOTTOMADJUST_Y]) 
                            circle(1);
                        
                        //m2 screw - RIGHT
                        translate ([M1BOTTOMADJUST_X,M1BOTTOMADJUST_Y]) 
                            circle(1);   
                }
            
            }
        
        //segment 2
        translate ([0,0,segment0_h+segment1_h])
            linear_extrude(height = segment2_h) {    
                difference (){
                   union () {
                        //rounded top
                        translate ([0,2*TOPCIRCLE-TOPCIRCLEADJUST]) 
                            circle (TOPCIRCLE);
                        //trapezoid base
                        polygon ([
                                [-POLYGON_X,POLYGON_Y],
                                [POLYGON_X,POLYGON_Y],
                                [TRAPEZOID_X, TRAPEZOID_Y],
                                [-TRAPEZOID_X, TRAPEZOID_Y]]);  
                       
                    }
                    
                    //cutouts
                        //laser module wire connector            
                        translate ([0,LASERADJUST*TOPCIRCLE/2]) 
                            square ([rectangle_h,rectangle_w], center=true);
                    
                     //laser module hole
                        translate ([0,LASERADJUST*TOPCIRCLE/2]) 
                            scale([1.3,1])
                                circle (hole0_d/2);
                        //finger curvature
                        translate ([0,BOTTOMCIRCLEADJUST]) 
                            circle (BOTTOMCIRCLE);
                        
                        //m2 screw - left
                        translate ([-M1BOTTOMADJUST_X,M1BOTTOMADJUST_Y]) 
                            circle(1);
                    
                        //m2 screw - RIGHT
                        translate ([M1BOTTOMADJUST_X,M1BOTTOMADJUST_Y]) 
                            circle(1);           
                } 
            }
        //rounded bottom
        linear_extrude(height = total_h) {
            translate ([TRAPEZOID_X-strap_x,TRAPEZOID_Y-strap_y])
                square (size = [strap_x,strap_y]);
        
            translate ([TRAPEZOID_X-strap_x/2,TRAPEZOID_Y-strap_y])
                circle (strap_x/2);
                
            translate ([-TRAPEZOID_X,TRAPEZOID_Y-strap_y])
                square (size = [strap_x,strap_y]);
            
            translate ([-TRAPEZOID_X+strap_x/2,TRAPEZOID_Y-strap_y])
                circle (strap_x/2);
        }
    }
    
}

translate ([0,0,FRONT_H]) rotate ([0,180,0]) laserfront ();
translate ([2.5*TRAPEZOID_X,0]) 
laserwires ();
