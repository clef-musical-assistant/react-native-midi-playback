# react-native-midi-playback

A Native Module to play MIDI files in a React Native application. This module wraps AVMIDIPlayer on iOS and MediaPlayer on Android.

On iOS, by default the player will just generate sine waves. You can specify a sound bank with the .sf2 extension.

On Android, the player will use a nice piano soundfont. There is no way to specify a soundfont on Android with MediaPlayer unfortunately :(

## Installation

```sh
npm install react-native-midi-playback
```

## Usage

```js
import MidiPlayback from "react-native-midi-playback";

// ...
MidiPlayback.setPlaybackFile(path);

// -------------- Only on iOS
MidiPlayback.setSoundBank(soundBankPath);
// --------------

MidiPlayback.play();
```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## Acknowlegements
Thank you to [MIDIPlayer](https://github.com/genedelisa/MIDIPlayer)

## License

MIT
