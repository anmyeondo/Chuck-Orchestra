SndBuf kick => Gain master => dac;
SndBuf snare => dac;
SndBuf hihat => dac;
SndBuf crash => dac;

BPM bpm;
bpm.tempo(120);
bpm.en => dur en; // eighth note (1/8)
bpm.sn => dur sn; // quarter note (1/4)
bpm.qn => dur qn; // quarter note (1/4)
bpm.hn => dur hn; // half note (1/2)

[  
   en,
  
   en, en, en, en, en, en,
   en, en, en, en, en, en,
   en, en, en, en, en, en,
   en, en, en, en, en, en,
   
   en, en, en, en, en, en,
   en, en, en, en, en, en,
   en, en, en, en, en, en,
   en, en, en, en, en, en,
   
   en, en, en, en, en, en,
   en, en, en, en, en, en,
   en, en, en, en, en, en,
   en, en, en, en, en, en,
   
   en, en, en, en, en, en,
   en, en, en, en, en, en,
   en, en, en, en, en, en,
   en, en, en, en, en, en,
   en, en, en, en
] @=> dur duration[];

/* 
1 : crash + hihat + kick
2 : hihat
3 : hihat + snare
4 : kick + snare
5 : kick + hihat
*/
[
 -1,
 
 1, 2, 2, 4, 2, 2,
 5, 5, 5, 4, 2, 2,
 5, 2, 2, 4, 2, 2,
 5, 5, 5, 4, 2, 2,
 
 1, 2, 2, 4, 2, 2,
 5, 5, 5, 4, 2, 2,
 5, 2, 2, 4, 2, 2,
 5, 5, 5, 4, 2, 2,
 
 1, 2, 2, 4, 2, 2,
 5, 5, 5, 4, 2, 2,
 5, 2, 2, 4, 2, 2,
 5, 5, 5, 4, 2, 2,
 
 1, 2, 2, 4, 2, 2,
 5, 5, 5, 4, 2, 2,
 5, 2, 2, 1, 1, 1,
 1, 1, 1, 1, -1, -1, -1, -1
] @=> int drumbeat[];


fun void ondrum(SndBuf drum, float vol) {
    vol => drum.gain;
}

fun void setDrum(int hits[], int idx) {
   if(hits[idx] == 1) {
       ondrum(crash, 0.2); ondrum(hihat, 0.1); ondrum(kick, 0.2);
       0 => crash.pos;
       0 => hihat.pos;
       0 => kick.pos;
   }
   else if(hits[idx] == 2) {
       ondrum(hihat, 0.1);
       0 => hihat.pos;
   }
   else if(hits[idx] == 3) {
       ondrum(hihat, 0.1); ondrum(snare, 0.3);
       0 => hihat.pos;
       0 => snare.pos;
   }
   else if(hits[idx] == 4) {
       ondrum(kick, 0.2); ondrum(snare, 0.3);
       0 => kick.pos;
       0 => snare.pos;
   }
   else if(hits[idx] == 5) {
       ondrum(kick, 0.2); ondrum(hihat, 0.1);
       0 => kick.pos;
       0 => hihat.pos;
   }
}

fun void playNotes(dur durs[]) {
    for(0 => int i ; i < durs.size() ; i++) {
        setDrum(drumbeat, i);
        durs[i] => now;
    }
}

fun void init() {
    0 => hihat.gain;
    0 => kick.gain;
    0 => snare.gain;
    0 => crash.gain;
    me.dir() + "../../drum/kick.wav" => kick.read;
    me.dir() + "../../drum/snare.wav" => snare.read;
    me.dir() + "../../drum/hihat.wav" => hihat.read;
    me.dir() + "../../drum/crash.wav" => crash.read;
}

init();
playNotes(duration);