// Based on example at https://github.com/genedelisa/MIDIPlayer/blob/master/MIDIPlayer/ViewController.swift

import AVFoundation

@objc(MidiPlayback)
class MidiPlayback: NSObject {
    
    var midiPlayer: AVMIDIPlayer?
    var soundBankURL: URL?
    var fileURL: URL?
    var midiData: Data?

    @objc(setPlaybackFile:)
    func setPlaybackFile(_ midiFileURL: NSString) {
        self.fileURL = URL(string: midiFileURL as String)
        self.midiData = nil
        do {
            try self.midiPlayer = AVMIDIPlayer(contentsOf: self.fileURL!, soundBankURL: self.soundBankURL)
        } catch let error {
            print(error.localizedDescription)
        }

        self.midiPlayer?.prepareToPlay()
    }

    @objc(setPlaybackData:)
    func setPlaybackData(_ midiData: NSData) {
        self.midiData = midiData as Data
        self.fileURL = nil
        do {
            try self.midiPlayer = AVMIDIPlayer(data: self.midiData!, soundBankURL: self.soundBankURL)
        } catch let error {
            print(error.localizedDescription)
        }

        self.midiPlayer?.prepareToPlay()
    }

    @objc(setSoundBank:)
    func setSoundBank(_ soundBankURL: NSString) {
        self.soundBankURL = URL(string: soundBankURL as String)
        if self.midiPlayer != nil && self.fileURL != nil {
            do {
             try self.midiPlayer = AVMIDIPlayer(contentsOf: self.fileURL!, soundBankURL: self.soundBankURL)
            } catch let error {
                print(error.localizedDescription)
            }
        }
        else if self.midiPlayer != nil && self.midiData != nil {
            do {
                try self.midiPlayer = AVMIDIPlayer(data: self.midiData!, soundBankURL: self.soundBankURL)
            } catch let error {
                print(error.localizedDescription)
            }
            
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

    @objc
    func isPlaying() -> Bool {
        if self.midiPlayer != nil {
            return self.midiPlayer!.isPlaying
        }
        else {
            return false
        }
    }
}
