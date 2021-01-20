import { NativeModules } from 'react-native';

type MidiPlaybackType = {
  multiply(a: number, b: number): Promise<number>;
};

const { MidiPlayback } = NativeModules;

export default MidiPlayback as MidiPlaybackType;
