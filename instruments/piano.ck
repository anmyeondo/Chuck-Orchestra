Hid hi; //Human interface 
HidMsg msg;

0 => int device;

if(!hi.openKeyboard(device)) {
    <<< "Can't open thiis device!" >>>;
    me.exit();
}
<<< "Keyboard os ready." , hi.name() >>>;

Rhodey piano => JCRev r=>dac;

while(true){
    hi=>now;//wait for keyboard event
    while(hi.recv(msg)){
        if(msg.isButtonDown()){
            <<<"key down: ",msg.ascii>>>;
            float freq;
            if(msg.ascii==81)//key is 1
                60 => Std.mtof=> piano.freq;//C4
            else if(msg.ascii==50)
                61 =>Std.mtof=>piano.freq;//D4b

            else if(msg.ascii==87)
                62 =>Std.mtof=>piano.freq;//D4
            else if(msg.ascii==51)
                63 =>Std.mtof=>piano.freq;//E4b

            else if(msg.ascii==69)
                64=>Std.mtof=>piano.freq;//E4

            else if(msg.ascii==82)
                65=>Std.mtof=>piano.freq;//F4
            
            else if(msg.ascii==53)
                66=>Std.mtof=>piano.freq;//G4b
            else if(msg.ascii==84)
                67=>Std.mtof=>piano.freq;//G4

            else if(msg.ascii==54)
                68=>Std.mtof=>piano.freq;//A4b
            else if(msg.ascii==89)
                69=>Std.mtof=>piano.freq;//A4

            else if(msg.ascii==55)
                70=>Std.mtof=>piano.freq;//B4b
            else if(msg.ascii==85)
                71=>Std.mtof=>piano.freq;//B4
            
            // 2옥타브
            else if(msg.ascii==73)//key is 1
                72 => Std.mtof=> piano.freq;//C4
            else if(msg.ascii==57)
                73 =>Std.mtof=>piano.freq;//D4b

            else if(msg.ascii==79)
                74 =>Std.mtof=>piano.freq;//D4
            else if(msg.ascii==48)
                75 =>Std.mtof=>piano.freq;//E4b

            else if(msg.ascii==80)
                76 =>Std.mtof=>piano.freq;//E4

            else if(msg.ascii==91)
                77 =>Std.mtof=>piano.freq;//F4
            
            else if(msg.ascii==53)
                78 =>Std.mtof=>piano.freq;//G4b
            else if(msg.ascii==93)
                79 =>Std.mtof=>piano.freq;//G4

            // else if(msg.ascii==54)
            //     68=>Std.mtof=>piano.freq;//A4b
            else if(msg.ascii==92)
                81=>Std.mtof=>piano.freq;//A4

            // else if(msg.ascii==55)
            //     70=>Std.mtof=>piano.freq;//B4b
            // else if(msg.ascii==85)
            //     71=>Std.mtof=>piano.freq;//B4


            else continue;
            1=>piano.noteOn;
            80::ms=>now;
        }
        else {
            //<<<"key up : " , msg.ascii>>>;
            1=>piano.noteOff;
        }
    }
}