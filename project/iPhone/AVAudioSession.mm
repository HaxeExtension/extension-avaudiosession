#include <AVFoundation/AVFoundation.h>
#include <Foundation/Foundation.h>
#include <UIKit/UIKit.h>

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

namespace avaudiosession
{

	bool is_other_audio_playing()
	{
		if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0"))
		{
			return [[AVAudioSession sharedInstance] secondaryAudioShouldBeSilencedHint];
		}
		else if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"6.0"))
		{
			return [[AVAudioSession sharedInstance] isOtherAudioPlaying];
		}
		else
		{
			return false;
		}
	}

	const char* get_audio_session_category()
	{
		return [[[AVAudioSession sharedInstance] category] UTF8String];
	}

	void set_audio_session_category(const char* category)
	{
		[[AVAudioSession sharedInstance] setCategory:[NSString stringWithUTF8String:category] error:nil];
	}

}
