from moviepy.editor import VideoFileClip, AudioFileClip

# Specify the paths to the video and audio files
video_path = 'data/video10.mp4'
audio_path = 'data/b10.mp3'

# Load the video and the audio
video_clip = VideoFileClip(video_path)
audio_clip = AudioFileClip(audio_path)

# Specify the start time for the audio (in seconds)
audio_start_time = 10  # Start at 10 seconds

# Trim the audio clip to start at the specified time
audio_clip = audio_clip.subclip(audio_start_time)

# Make sure the audio matches the video's duration
if audio_clip.duration > video_clip.duration:
    audio_clip = audio_clip.subclip(0, video_clip.duration)

# Set the audio of the video clip as the trimmed audio clip
final_clip = video_clip.set_audio(audio_clip)

# Write the result to a file (change the filename as needed)
final_clip.write_videofile('data/video10_b.mp4', codec='libx264', audio_codec='aac')
