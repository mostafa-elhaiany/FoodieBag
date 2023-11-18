import cv2
import os

# Define the path to the directory containing the videos
directory_path = 'video6'

# List all video files in the directory
video_files = [f for f in os.listdir(directory_path) if f.lower().endswith(('.mp4', '.avi', '.mov', '.mkv'))]
video_files = [os.path.join(directory_path, f) for f in sorted(video_files, key=lambda x: os.path.getmtime(os.path.join(directory_path, x)))]

# Check if there are video files in the directory
if not video_files:
    print("No video files found in the directory.")
    exit()

# Read the first video to determine frame size and frame rate
cap = cv2.VideoCapture(video_files[0])
frame_width = int(cap.get(cv2.CAP_PROP_FRAME_WIDTH))
frame_height = int(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))
fps = cap.get(cv2.CAP_PROP_FPS)
cap.release()

# Define the codec and create a VideoWriter object
fourcc = cv2.VideoWriter_fourcc(*'mp4v')  # or use 'XVID' for .avi format
out = cv2.VideoWriter('video6.mp4', fourcc, fps, (frame_width, frame_height))

# Function to read and write frames from a video
def process_video(video_path):
    cap = cv2.VideoCapture(video_path)
    while cap.isOpened():
        ret, frame = cap.read()
        if not ret:
            break
        out.write(frame)
    cap.release()

# Process each video file
for video_file in video_files:
    print(f"Processing {video_file}...")
    process_video(video_file)

# Release everything when job is finished
out.release()
cv2.destroyAllWindows()