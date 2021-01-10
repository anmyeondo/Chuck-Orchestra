// ID : 2017012188
// Name : Um Tae-Ho

Hid hi; //Human interface 
HidMsg msg;

me.dir() + "/right.ck" => string melodypath;
me.dir() + "/left.ck" => string leftpath;
me.dir() + "/drum.ck" => string drumpath;
me.dir() + "/addition.ck" => string additionpath;
me.dir() + "/drumset.ck" => string drumsetpath;
me.dir() + "/test.ck" => string testpath;
0 => int device;
if(!hi.openKeyboard(device)) {
    <<< "Can't open thiis device!" >>>;
    me.exit();
}
<<< "======= select music =====" >>>;
<<< "1. Resolver" >>>;
<<< "2. He's a Pirate" >>>;
<<< "======= select music =====" >>>;


0 => int music;
while(true) {
    0 => int chk;
    while(hi.recv(msg)){
        if(msg.isButtonDown()){
            if(msg.ascii==49) {
                1 => music;

            }
            if(msg.ascii==50) {
                2 => music;
            }
        }
        if(music != 0) break;
    }   
    if(music != 0) break;
}
<<< "\n\n\n======= Music Selected =====\n\n\n" >>>;
        <<< "======= select mode =====" >>>;
            <<< "1.Practice Right hand" >>>;
            <<< "2.Practice Left hand" >>>;
            <<< "3.Practice Drum" >>>;
            <<< "4. Just Listening " >>>;
        <<< "======= select music =====" >>>;     


while(true) {
    0 => int selected;
    while(hi.recv(msg)){
        hi => now;
        /* He's a Pirate */
        if(music==2) {
            if(msg.isButtonDown()){
                if(msg.ascii==49) {
                    1 => selected;
                    for(1 => int i ; i <= 2 ; i++) {
                        <<< 2 - i + 1 + "second left!" >>>;
                        1::second=>now;
                    }
                    Machine.add(testpath) => int testID;
                    Machine.add(leftpath) => int leftID;
                    Machine.add(drumpath) => int drumID;
                }
                
                else if(msg.ascii==50) {
                    1 => selected;
                    for(1 => int i ; i <= 2 ; i++) {
                        <<< 2 - i + 1 + "second left!" >>>;
                        1::second=>now;
                    }
                    Machine.add(testpath) => int testID;
                    Machine.add(melodypath) => int melodyID;
                    Machine.add(drumpath) => int drumID;
                }
                
                else if(msg.ascii==51) {
                    1 => selected;
                    for(1 => int i ; i <= 2 ; i++) {
                        <<< 2 - i + 1 + "second left!" >>>;
                        1::second=>now;
                    }
                    Machine.add(melodypath) => int melodyID;
                    Machine.add(leftpath) => int leftID;
                    Machine.add(drumsetpath) => int drumsetID;
                }

                else if(msg.ascii==52) {
                    1 => selected;
                    for(1 => int i ; i <= 2 ; i++) {
                        <<< 2 - i + 1 + "second left!" >>>;
                        1::second=>now;
                    }
                    Machine.add(melodypath) => int melodyID;
                    Machine.add(leftpath) => int leftID;
                    Machine.add(drumpath) => int drumID;
                } 
            }
        }
        if(selected != 0) break;
        /* He's a Pirate */
    }
    if(selected != 0) break;   
}