// ID : 2017012188
// Name : Um Tae-Ho


BPM bpm;
bpm.tempo(120);
bpm.en => dur en; // eighth note (1/8)
bpm.sn => dur sn; // quarter note (1/4)
bpm.qn => dur qn; // quarter note (1/4)
bpm.hn => dur hn; // half note (1/2)
0::second => dur sum;


60 => int C;
61 => int Db;
62 => int D;
63 => int Eb;
64 => int E;
65 => int F;
66 => int Gb;
67 => int G;
68 => int Ab;
69 => int A;
70 => int Bb;
71 => int B;
12 => int o;

[
    A-12, C,
    D, D, D, E, F, F, F, G,
    E, E, D, C, C, D, A-12, C,
    
    D, D, D, E, F, F, F, G,
    E, E, D, C, D, -1, A-12, C,
    
    D, D, D, F, G, G, G, A, Bb, Bb,
    A, G, A, D, D, E,
    
    F, F, G, A, D, D, F,
    E, E, F, D, E
]
@=> int notes[];

[
    A-12, C,
    D, D, D, E, F, F, F, G,
    E, E, D, C, C, D, A-12, C,
    
    D, D, D, E, F, F, F, G,
    E, E, D, C, D, -1, A-12, C,
    
    D, D, D, F, G, G, G, A, Bb, Bb,
    A, G, A, D, D, E,
    
    F, F, G, A, D, D, F,
    E, E, D, C, D
]
@=> int notes2[];

[
    A-12+o, C+o,
    D+o, D+o, D+o, E+o, F+o, F+o, F+o, G+o,
    E+o, E+o, D+o, C+o, C+o, D+o, A-12+o, C+o,
    
    D+o, D+o, D+o, E+o, F+o, F+o, F+o, G+o,
    E+o, E+o, D+o, C+o, D+o, -1+o, A-12+o, C+o,
    
    D+o, D+o, D+o, F+o, G+o, G+o, G+o, A+o, Bb+o, Bb+o,
    A+o, G+o, A+o, D+o, D+o, E+o,
    
    F+o, F+o, G+o, A+o, D+o, D+o, F+o,
    E+o, E+o, D+o, C+o, D+o
]
@=> int upnotes[];

[
    -1, -1,
    D, A-o, D,
    F, D, F,
    E, C, E,
    D, A-o, D,
    D, B-o, D,
    A, C, A,
    
    E, C, E,
    D, A-o, F-o,
    D, A-o, D,
    G, D, G,
    B, G, B,
    A, F, A,
    F, D, F,
    C+o, F, C+o,
    F, C, F
]
@=> int addnotes[];

[
    sn, sn,
    en, en, en,
    en, en, en,
    en, en, en,
    en, en, en,
    en, en, en,
    en, en, en,

    en, en, en,
    en, en, en,
    en, en, en,
    en, en, en,
    en, en, en,
    en, en, en,
    en, en, en,
    en, en, en,
    en, en, en
]
@=> dur adddur[];

[
    sn, sn,
    en, en, sn, sn, en, en, sn, sn,
    en, en, sn, sn, sn, en*1.5, sn, sn,
    
    en, en, sn, sn, en, en, sn, sn,
    en, en, sn, sn, en*1.5, sn, sn, sn,
    
    en, en, sn, sn, en, en, sn, sn,
    en, en, sn, sn, sn, en+sn, sn, sn,
    
    en, en, en, sn, en+sn, sn, sn, 
    en, en, sn, sn, qn*1.5
]
@=> dur durs[];


Mandolin finger;
Mandolin finger2;
Mandolin finger3;
finger => dac;
finger2 => dac;
finger3 => dac;
Player p1;
Player p2;
Player p3;

0.33 => finger.gain;
0.33 => finger2.gain;
0.33 => finger3.gain;

for(0 => int i ; i < durs.cap() ; i++) {
    sum + durs[i] => sum;
}

spork ~ p1.play(finger, notes, durs);
sum - en => now;
spork ~ p1.play(finger, notes2, durs);
spork ~ p2.play(finger2, upnotes, durs);
spork ~ p3.play(finger3, addnotes, adddur);
sum + qn*4 => now;