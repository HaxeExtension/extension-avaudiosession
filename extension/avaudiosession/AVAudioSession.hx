package extension.avaudiosession;

#if cpp
import cpp.Lib;
#elseif neko
import neko.Lib;
#end

class AVAudioSession
{

	public static var backgroundAudio(get, never):Bool;
	public static var category(get, set):AVAudioSessionCategory;

	static function get_backgroundAudio():Bool
	{
		#if ios
		return avaudiosession_is_other_audio_playing();
		#else
		return false;
		#end
	}

	static function get_category():AVAudioSessionCategory
	{
		#if ios
		return avaudiosession_get_category();
		#else
		return null;
		#end
	}

	static function set_category(value:AVAudioSessionCategory):AVAudioSessionCategory
	{
		#if ios
		avaudiosession_set_category(value);
		#end

		return category;
	}

	#if ios
	static var avaudiosession_is_other_audio_playing = Lib.load("avaudiosession", "avaudiosession_is_other_audio_playing", 0);
	static var avaudiosession_get_category = Lib.load("avaudiosession", "avaudiosession_get_category", 0);
	static var avaudiosession_set_category = Lib.load("avaudiosession", "avaudiosession_set_category", 1);
	#end

}

@:enum
abstract AVAudioSessionCategory(String)
{
	var Ambient = "AVAudioSessionCategoryAmbient";
	var SoloAmbient = "AVAudioSessionCategorySoloAmbient";
	var Playback = "AVAudioSessionCategoryPlayback";
	var Record = "AVAudioSessionCategoryRecord";
	var PlayAndRecord = "AVAudioSessionCategoryPlayAndRecord";
	var AudioProcessing = "AVAudioSessionCategoryAudioProcessing";
	var MultiRoute = "AVAudioSessionCategoryMultiRoute";
}
