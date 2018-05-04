#ifndef AVAUDIOSESSION_H
#define AVAUDIOSESSION_H

namespace avaudiosession
{

	bool is_other_audio_playing();
	const char* get_audio_session_category();
	void set_audio_session_category(const char* category);

}

#endif
