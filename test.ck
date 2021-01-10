Hid hi; //Human interface 
HidMsg msg;

0 => int device;

if(!hi.openKeyboard(device)) {
    <<< "Can't open thiis device!" >>>;
    me.exit();
}
<<< "Keyboard os ready." , hi.name() >>>;

BeeThree organ => JCRev r=>dac;

while(true){
    hi=>now;//wait for keyboard event
    while(hi.recv(msg)){
        if(msg.isButtonDown()){
            <<<"key down: ",msg.ascii>>>;
            float freq;
            if(msg.ascii==49)//key is 1
                60 => Std.mtof=> organ.freq;//C
            else if(msg.ascii==50)
                62=>Std.mtof=>organ.freq;
            else if(msg.ascii==51)
                64=>Std.mtof=>organ.freq;
            else if(msg.ascii==52)
                65=>Std.mtof=>organ.freq;
            else if(msg.ascii==53)
                67=>Std.mtof=>organ.freq;
            else continue;
            1=>organ.noteOn;
            80::ms=>now;
        }
        else {
            //<<<"key up : " , msg.ascii>>>;
            1=>organ.noteOff;
        }
    }
}