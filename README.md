# extension-avaudiosession

An OpenFL extension that adds support for setting the audio session category on iOS.

This extension changes the default audio session category to `AVAudioSessionCategoryAmbient`. For more information about the different possible categories, see the official [Audio Session Categories](https://developer.apple.com/documentation/avfoundation/avaudiosession/audio_session_categories) documentation.

## Usage

### Querying whether background audio is playing

A common use-case is to mute the game music while the user is listening to their own audio in the background (e.g. a podcast or music).

```haxe
import extension.avaudiosession.AVAudioSession;
import openfl.display.Sprite;
import openfl.events.FocusEvent;

class AutoMuteBackgroundMusicExample extends Sprite
{
    public function new()
    {
        super();

        stage.addEventListener(FocusEvent.FOCUS_IN, onFocusIn);
    }

    function onFocusIn(e:FocusEvent)
    {
        if (AVAudioSession.backgroundAudio)
        {
            // Stop playing game music
        }
        else
        {
            // Start playing game music
        }
    }
}
```

### Setting AVAudioSession category

If your app heavily relies on the audio, you might want to stop background audio from other sources playing while your app is focused.

```haxe
import extension.avaudiosession.AVAudioSession;
import openfl.display.Sprite;

class MuteOtherBackgroundAudioExample extends Sprite
{
    public function new()
    {
        super();

        AVAudioSession.category = AVAudioSessionCategory.SoloAmbient;
    }
}
```

## License

The MIT License (MIT) - [LICENSE.md](LICENSE.md)