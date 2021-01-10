Hid hi; //Human interface 
HidMsg msg;

SndBuf kick => Gain master => dac;
SndBuf snare => dac;
SndBuf hihat => dac;
SndBuf crash => dac;

0 => int device;
hi.openKeyboard(device);
fun void init() {
    0 => hihat.gain;
    0 => kick.gain;
    0 => snare.gain;
    0 => crash.gain;
    me.dir() + "../drum/kick.wav" => kick.read;
    me.dir() + "../drum/snare.wav" => snare.read;
    me.dir() + "../drum/hihat.wav" => hihat.read;
    me.dir() + "../drum/crash.wav" => crash.read;
}

fun void ondrum(SndBuf drum, float vol) {
    vol => drum.gain;
}

fun void setDrum(string target) {
   if(target == "hihat") {
       ondrum(hihat, 0.2);
       0 => hihat.pos;
   }
   else if(target == "kick") {
       ondrum(kick, 0.7);
       0 => kick.pos;
   }
   else if(target == "snare") {
       ondrum(snare, 0.6);
       0 => snare.pos;
   }
   else if(target == "crash") {
       ondrum(crash, 0.8);
       0 => crash.pos;
   }
}
init();
while(true){
    hi=>now;//wait for keyboard event
    while(hi.recv(msg)){
        if(msg.isButtonDown()){
            float freq;
            if(msg.ascii==83)//key is S
                setDrum("kick");
            else if(msg.ascii==73)
                setDrum("hihat");
            else if(msg.ascii==77 || msg.ascii==44)
                setDrum("snare");
            else if(msg.ascii==45)
                setDrum("crash");
            else continue;
        }
    }
}