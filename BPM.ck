// ID : 2017012188
// Name : Um Tae-Ho

public class BPM {
    
    static dur qn, en, sn, hn;
    
    fun void tempo(float beat) {   
        60.0/(beat) => float SPB;
        SPB :: second => qn; 
        qn * 2.0 => hn;
        qn * 0.5 => en;
        en * 0.5 => sn;
    }
}
