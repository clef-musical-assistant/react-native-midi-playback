import * as React from 'react';

import { StyleSheet, View, Text } from 'react-native';
import MidiPlayback from 'react-native-midi-playback';

export default function App() {
  React.useEffect(() => {
    MidiPlayback.setPlaybackFile('Queen_-_Another_One_Bites_the_Dust.mid');
    MidiPlayback.play();
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
