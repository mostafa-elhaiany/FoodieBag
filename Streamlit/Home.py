import json

def __filter(list, user_preferences):
    if(len(user_preferences)==0):
        return list
    filtered_objects = [obj for obj in list if any(tag in user_preferences for tag in obj.get('tags', []))]
    return filtered_objects


def display_local_video_grid(st, json_list, tags):

    filtered_list = __filter(json_list, tags)
    if(len(filtered_list)==0):
        st.write("Unfortunalty no videos right now")
        return
    # Calculate the number of rows needed in the grid
    num_cols = 3
    num_rows = (len(json_list) + num_cols - 1) // num_cols
    # Create a grid layout
    for row in range(num_rows):
        cols = st.columns(num_cols)
        for col in range(num_cols):
            index = row * num_cols + col
            if index < len(filtered_list):
                path = filtered_list[index]["path"]
                video = open(path, 'rb')
                video_bytes = video.read()
                cols[col].video(video_bytes)
            else:
                break


def draw_home(st, tags):
    st.title("Home Page")
    st.write("Have a look at our selection of Ai generated Recipe videos!")    # Add an interactive widget
    st.divider()

    with open("Streamlit/Assets/data.json", "r") as f:
        json_file = json.load(f)

    display_local_video_grid(st,json_file,tags)
