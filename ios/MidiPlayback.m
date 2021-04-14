#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(MidiPlayback, NSObject)

RCT_EXTERN_METHOD(setPlaybackFile:(NSString *)url)
RCT_EXTERN_METHOD(setSoundBank:(NSString *)soundBankURL)
RCT_EXTERN_METHOD(setPlaybackData:(NSData *)data)
RCT_EXTERN_METHOD(play)
RCT_EXTERN_METHOD(stop)
RCT_EXTERN_METHOD(isPlaying)

@end
