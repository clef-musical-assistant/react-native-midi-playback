import { NativeModules } from 'react-native';

type MidiPlaybackType = {
  setPlaybackFile(url: string): void;
  setPlaybackData(data: string): void;
  play(): void;
  stop(): void;
  reset(): void;
};

const { MidiPlayback } = NativeModules;

export default MidiPlayback as MidiPlaybackType;
