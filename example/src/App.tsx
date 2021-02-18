import * as React from 'react';

import { StyleSheet, View, Text } from 'react-native';
import { Buffer } from 'buffer';
import MidiPlayback from 'react-native-midi-playback';
import * as RNFS from 'react-native-fs';
import { Midi } from '@tonejs/midi';
import * as song from './song.json';

export default function App() {
  React.useEffect(() => {
    let midi = new Midi();
    midi.fromJSON(song);
    // on iOS this path has a slash at the end, on Android it does not
    // check to see if we need to add a slash before our file name
    let slash =
      RNFS.TemporaryDirectoryPath[RNFS.TemporaryDirectoryPath.length - 1] ===
      '/'
        ? ''
        : '/';
    let path = RNFS.TemporaryDirectoryPath + slash + 'song.mid';
    RNFS.write(
      path,
      Buffer.from(midi.toArray()).toString('binary'),
      undefined,
      'ascii'
    )
      .then(() => {
        console.log('Successfully wrote MIDI file to ' + path);
        MidiPlayback.setPlaybackFile(path);
      })
      .then(() => {
        MidiPlayback.play();
        console.log(MidiPlayback.isPlaying());
      })
      .catch((err) => {
        console.log(err.message);
      });
  }, []);

  return (
    <View style={styles.container}>
      <Text>Running</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});
