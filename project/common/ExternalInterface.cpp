#ifndef STATIC_LINK
#define IMPLEMENT_API
#endif

#if defined(HX_WINDOWS) || defined(HX_MACOS) || defined(HX_LINUX)
#define NEKO_COMPATIBLE
#endif

#include <hx/CFFI.h>
#include "AVAudioSession.h"

using namespace avaudiosession;

static value avaudiosession_is_other_audio_playing()
{
	#ifdef IPHONE
	return alloc_bool(is_other_audio_playing());
	#endif
	return alloc_bool(false);
}
DEFINE_PRIM(avaudiosession_is_other_audio_playing, 0);

static value avaudiosession_get_category()
{
	#ifdef IPHONE
	return alloc_string(get_audio_session_category());
	#endif
	return alloc_null();
}
DEFINE_PRIM(avaudiosession_get_category, 0);

static value avaudiosession_set_category(value category)
{
	#ifdef IPHONE
	set_audio_session_category(val_string(category));
	#endif
	return alloc_null();
}
DEFINE_PRIM(avaudiosession_set_category, 1);

extern "C" void avaudiosession_main ()
{
	val_int(0); // Fix Neko init
}
DEFINE_ENTRY_POINT(avaudiosession_main);

extern "C" int avaudiosession_register_prims()
{
	#ifdef IPHONE
	set_audio_session_category("AVAudioSessionCategoryAmbient");
	#endif
	return 0;
}
