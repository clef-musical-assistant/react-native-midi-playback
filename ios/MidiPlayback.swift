// Based on example at https://github.com/genedelisa/MIDIPlayer/blob/master/MIDIPlayer/ViewController.swift

import AVFoundation

@objc(MidiPlayback)
class MidiPlayback: NSObject {
    
    var midiPlayer: AVMIDIPlayer?
    var soundBankURL: URL?

    @objc(setPlaybackFile:)
    func setPlaybackFile(_ midiFileURL: NSString) {
        let path = URL(string: midiFileURL as String)
        print("setPlaybackFile " + (midiFileURL as String))
        do {
            //TODO get URL from filesystem
            try self.midiPlayer = AVMIDIPlayer(contentsOf: path!, soundBankURL: Bundle.main.url(forResource: "Essential Keys-C-v1.0", withExtension: ".sf2"))
        } catch let error {
            print(error.localizedDescription)
        }

        self.midiPlayer?.prepareToPlay()
    }

    @objc(setPlaybackData:)
    func setPlaybackData(_ midiData: NSData) {
        do {
            try self.midiPlayer = AVMIDIPlayer(data: midiData as Data, soundBankURL: self.soundBankURL)
        } catch let error {
            print(error.localizedDescription)
        }

        self.midiPlayer?.prepareToPlay()
    }

    @objc(play)
    func play() {
        self.midiPlayer?.play()
    }

    @objc(reset)
    func reset() {
        self.midiPlayer?.currentPosition = 0
    }

    @objc(stop)
    func stop() {
        self.midiPlayer?.stop()
    }
}
