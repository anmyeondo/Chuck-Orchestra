BPM bpm;
bpm.tempo(120);
bpm.en => dur en; // eighth note (1/8)
bpm.sn => dur sn; // quarter note (1/4)
bpm.qn => dur qn; // quarter note (1/4)
bpm.hn => dur hn; // half note (1/2)
0::second => dur sum;


48 => int C;
49 => int Db;
50 => int D;
51 => int Eb;
52 => int E;
53 => int F;
54 => int Gb;
55 => int G;
56 => int Ab;
57 => int A;
58 => int Bb;
59 => int B;
12 => int o;

[
    -1,
    D, D, B-o, B-o, 
    A-o, A-o, D, D,
    B-o, B-o, F-o, F-o,
    C, C, D, A-o, D, -1,
    
    D, D, B-o, B-o,
    G-o, G-o, D, D,
    B-o, B-o, D, D,
    A-o, A-o, A-o, A-o,
    
    D, D, B-o, B-o, 
    A-o, A-o, D, D,
    B-o, B-o, F-o, F-o,
    C, C, D, A-o, D, -1,
    
    D, D, B-o, B-o,
    G-o, G-o, D, D,
    B-o, B-o, D, D,
    A-o, A-o, A-o, A-o
]
@=> int notes[];

[
    -1,
    D - o, -1, B - 2*o, -1,
    A-2*o, -1, D - o, -1,
    B-2*o, -1, F-2*o, -1,
    C-o, -1, D-o, -1, -1, -1,
    
    D-o, -1, B-2*o, -1,
    G-2*o, -1, D-o, -1,
    B-2*o, -1, D-o, -1,
    A-2*o, -1, A-2*o, -1,
    
    D - o, -1, B - 2*o, -1,
    A-2*o, -1, D - o, -1,
    B-2*o, -1, F-2*o, -1,
    C-o, -1, D-o, -1, -1, -1,
    
    D-o, -1, B-2*o, -1,
    G-2*o, -1, D-o, -1,
    B-2*o, -1, D-o, -1,
    A-2*o, -1, A-2*o, -1
]
@=> int downnotes[];

[
    en,
    en*1.5, en*1.5, en*1.5, en*1.5,
    en*1.5, en*1.5, en*1.5, en*1.5,
    en*1.5, en*1.5, en*1.5, en*1.5,
    en*1.5, en*1.5, en, sn, sn, en,
    
    en*1.5, en*1.5, en*1.5, en*1.5,
    en*1.5, en*1.5, en*1.5, en*1.5,
    en*1.5, en*1.5, en*1.5, en*1.5,
    en*1.5, en*1.5, en*1.5, en*1.5,
    
    en*1.5, en*1.5, en*1.5, en*1.5,
    en*1.5, en*1.5, en*1.5, en*1.5,
    en*1.5, en*1.5, en*1.5, en*1.5,
    en*1.5, en*1.5, en, sn, sn, en,
    
    en*1.5, en*1.5, en*1.5, en*1.5,
    en*1.5, en*1.5, en*1.5, en*1.5,
    en*1.5, en*1.5, en*1.5, en*1.5,
    en*1.5, en*1.5, en*1.5, en*1.5
]
@=> dur durs[];

Mandolin finger;
Mandolin finger2;
finger => dac;
finger2 => dac;
0.35 => finger.gain;
0.35 => finger2.gain;
Player p1;
Player p2;

for(0 => int i ; i < durs.cap() ; i++) {
    sum + durs[i] => sum;
}

spork ~ p1.play(finger, notes, durs);
spork ~ p2.play(finger2, downnotes, durs);
sum + qn => now;