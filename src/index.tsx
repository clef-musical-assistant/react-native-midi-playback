import { NativeModules } from 'react-native';

type MidiPlaybackType = {
  setPlaybackFile(url: string): void;
  setPlaybackData(data: string): void;
  setSoundBank(url: string): void;
  play(): void;
  stop(): void;
  reset(): void;
  isPlaying(): boolean;
};

const { MidiPlayback } = NativeModules;

export default MidiPlayback as MidiPlaybackType;
