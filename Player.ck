// ID : 2017012188
// Name : Um Tae-Ho

public class Player {
    fun void playNote(StkInstrument instrument, int note, dur duration) {
        Std.mtof(note) => instrument.freq;
        if(note != -1) {
            1.0 => instrument.noteOn;
        }
        duration => now;
        1.0 => instrument.noteOff;
    }

    fun void play(StkInstrument instrument, int notes[], dur durations[]) {
        for(0 => int i ; i < notes.cap() ; i++) {
            playNote(instrument, notes[i], durations[i]);
        }
    }
}