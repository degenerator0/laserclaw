//2020-09-16
//WristbandBattery.scad
//https://github.com/degenerator0/
//https://www.instructables.com/member/degenerator0/
//https://www.thingiverse.com/degenerator/
//Battery chassis for Laserclaw project


$fs=.01;

XH254_BACK_X=5.75;
XH254_BACK_Y=7.95;
XH254_BACK_Z=5.75;
XH254_FRONT_X=7.52;
XH254_FRONT_Y=6.22;
XH254_FRONT_Z=6.40;
XH254_X=XH254_BACK_X+XH254_FRONT_X;
XH254_Y=XH254_BACK_Y+XH254_FRONT_Y;
XH254_Z=XH254_BACK_Z+XH254_FRONT_Z;
BATTERY_X=40;
BATTERY_Y=20;
BATTERY_Z=9;
2P_F_BOT_X=4.0;
2P_F_BOT_Y=6.5;
2P_F_BOT_Z=.85;
2P_F_TOP_X=4.0;
2P_F_TOP_Y=4.61;
2P_F_TOP_Z=2.15-.85;
2P_F_Z=2P_F_TOP_Z+2P_F_BOT_Z;
2P_B_X=5.4;
2P_B_Y=4.61;
2P_B_Z=2.63;
2P_X=2P_F_BOT_X+2P_B_Y;
2P_Y=2P_F_BOT_Y;
2P_Z=(2P_F_TOP_Z/2+2P_F_BOT_Z/2+2P_B_Z/2)/3;
SSWITCH_B_X=11;
SSWITCH_B_Y=6;
SSWITCH_B_Z=4.5;
SSWITCH_P_X=19.6;
SSWITCH_P_Y=6;
SSWITCH_P_Z=1;
SSWITCH_T_X=1.4;
SSWITCH_T_Y=.4;
SSWITCH_T_Z=2.25;

WRISTBAND_H=36;
WRISTBAND_D=BATTERY_X+2P_X+5.2+9+1;

module XH254 () {
}

module slideswitch () {
    $fs=.01;
    union () {
    //plate

        cube ([SSWITCH_P_X,SSWITCH_P_Y,SSWITCH_P_Z], center = true);
        
        translate ([-SSWITCH_P_X/2+2.5,0,-SSWITCH_P_Z/2])
        cylinder (h=SSWITCH_B_Z*2, r=1, center = true);
            translate ([SSWITCH_P_X/2-2.5,0,-SSWITCH_P_Z/2])
        cylinder (h=SSWITCH_B_Z*2, r=1, center = true);

    }
    

    
    //body
      translate ([0,0,-SSWITCH_P_Z/2-SSWITCH_B_Z/2])
      cube ([SSWITCH_B_X,SSWITCH_B_Y,SSWITCH_B_Z], center = true);
    //terminal
        translate ([0,0,-SSWITCH_P_Z/2-SSWITCH_B_Z-SSWITCH_T_Z/2])
        cube ([SSWITCH_T_X,SSWITCH_T_Y,SSWITCH_T_Z], center = true);
    translate ([-SSWITCH_T_X*2,0,-SSWITCH_P_Z/2-SSWITCH_B_Z-SSWITCH_T_Z/2])
        cube ([SSWITCH_T_X,SSWITCH_T_Y,SSWITCH_T_Z], center = true);
        translate ([SSWITCH_T_X*2,0,-SSWITCH_P_Z/2-SSWITCH_B_Z-SSWITCH_T_Z/2])
        cube ([SSWITCH_T_X,SSWITCH_T_Y,SSWITCH_T_Z], center = true);

}
module powerhouse () {
    cube ([BATTERY_X+2P_X+5.2+5,WRISTBAND_H,BATTERY_Z+15], center = true);
    
}


    
module wristband () {
    
    union (){
        difference () {
            union () {
                difference () {
                    //center
                    translate ([0,0,0])
                        rotate ([0,90,90])
                            cylinder(h=WRISTBAND_H, d=WRISTBAND_D,  center = true);
                    
                     //inner
                    translate ([0,0,0])
                        rotate ([0,90,90])
                            cylinder (h=WRISTBAND_H, d=WRISTBAND_D-4,center = true);
                }
                //powerhouse
                        translate ([0,0,WRISTBAND_D/4+1])
                            powerhouse ();
            }
           //cutouts
            
                //outer
                difference () {
                    translate ([0,0,0])
                        rotate ([0,90,90])
                            cylinder (h=WRISTBAND_H, d=WRISTBAND_D+17,center = true);
                    translate ([0,0,0])
                        rotate ([0,90,90])
                            cylinder(h=WRISTBAND_H, d=WRISTBAND_D,  center = true);
                }
                //inner lower
                translate ([0,0,-51])
                    rotate ([0,90,90])
                        cylinder(h=WRISTBAND_H, d=2*WRISTBAND_D,  center = true);
            
                //top
                translate ([0,0,WRISTBAND_D/4+1+BATTERY_Z+11])            
                    powerhouse ();
            
    
                //battery
                union () {
                    translate ([0,-2,WRISTBAND_D/4+3])
                        cube ([BATTERY_X,BATTERY_Y+16,BATTERY_Z], center = true);
            
                //bottom screws
                translate ([-BATTERY_X/2+2,-WRISTBAND_H/2+(XH254_FRONT_Y+2)/2,WRISTBAND_D/4-5])
                    cylinder (h=10, d=2, center = true);
                translate ([+BATTERY_X/2-2,-WRISTBAND_H/2+(XH254_FRONT_Y+2)/2,WRISTBAND_D/4-5])
                    cylinder (h=10, d=2, center = true);
    
                translate ([-BATTERY_X/2+2,-WRISTBAND_H/2+(XH254_FRONT_Y+2)/2,WRISTBAND_D/4-5.4])
                    cylinder (h=4.2, d=3.8, center = true);
    
                translate ([+BATTERY_X/2-2,-WRISTBAND_H/2+(XH254_FRONT_Y+2)/2,WRISTBAND_D/4-5.4])
                    cylinder (h=4.2, d=3.8, center = true);

              }
            
        
            //left strap
                translate ([-28,0,10])
                    rotate ([0,45,0])
                        cube ([20,WRISTBAND_H-8.5,2], center = true);

            //right strap
                translate ([28,0,10])
                    rotate ([0,-45,0])
                        cube ([20,WRISTBAND_H-8.5,2], center = true);
            }

    }
      
}

module endcap () {
    
    difference () {
        //plate
        cube ([BATTERY_X-.2,XH254_FRONT_Y+2.4,BATTERY_Z-.2], center = true);
       
        //connector
        translate ([-BATTERY_X/4,XH254_Y/2-.2,-BATTERY_Z/2+XH254_FRONT_Z/2+.4])
            rotate ([0,180,180])
                XH254 ();
        translate ([-BATTERY_X/4,XH254_Y/2+.2,-BATTERY_Z/2+XH254_FRONT_Z/2+.4])
            rotate ([0,180,180])
                XH254 ();
           
        translate ([-BATTERY_X/4,-(XH254_FRONT_Y+1.2)/2,-BATTERY_Z/2+XH254_FRONT_Z/2-.5])
            cube ([XH254_FRONT_X-1,1.2,XH254_FRONT_Z], center = true);
        
        translate ([-BATTERY_X/4,(XH254_FRONT_Y+1.2)/2,-BATTERY_Z/2+XH254_FRONT_Z/2+.1])
            cube ([XH254_FRONT_X-1,1.2,XH254_FRONT_Z], center = true);
     
        //switch
        translate ([BATTERY_X/4-2,-3,-BATTERY_Z/2+SSWITCH_P_Y/2])
            rotate ([90,0,0])
                slideswitch ();
        
        translate ([BATTERY_X/4-2,+4,-BATTERY_Z/2+SSWITCH_P_Y/2])
            rotate ([90,0,0])
                cube ([SSWITCH_B_X,SSWITCH_B_Y,SSWITCH_B_Z], center = true);
                
        translate ([BATTERY_X/4-2,-4,-BATTERY_Z/2+SSWITCH_P_Y/2])
            rotate ([90,0,0])
                cube ([SSWITCH_P_X,SSWITCH_P_Y,SSWITCH_P_Z], center = true);
     
        //bottom screws       
        translate ([-BATTERY_X/2+2,0,-BATTERY_Z/2])
            cylinder (h=10, d=2, center = true);
            
        translate ([BATTERY_X/2-2,0,-BATTERY_Z/2])
            cylinder (h=10, d=2, center = true);
    }
}     


 


translate ([0,0,WRISTBAND_H/2]) 
rotate ([-90,0,0])
wristband ();



translate ([0,-10,1]) 
rotate ([90,0,180])
endcap ();