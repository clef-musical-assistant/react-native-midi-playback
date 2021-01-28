#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(MidiPlayback, NSObject)

RCT_EXTERN_METHOD(setPlaybackFile:(string *)url)
RCT_EXTERN_METHOD(setPlaybackData:(NSData *)data)
RCT_EXTERN_METHOD(play)
RCT_EXTERN_METHOD(stop)

@end
