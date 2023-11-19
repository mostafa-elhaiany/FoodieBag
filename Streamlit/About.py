# import graphviz

def draw_about(st):
    st.title("About Page")
    st.write("This is the about page. Learn more about us here.")
    st.divider()
    st.video("Streamlit/Assets/Videos/avatars/target_transfer.mp4")

    st.divider()

    st.write("First let's visualize how the app looks like")

    # Create a graphlib graph object
    # graph = graphviz.Digraph()
    # graph.edge('User', 'GPT_1')
    # graph.edge('System', 'GPT_1')
    # graph.edge('GPT_1', 'GPT_1')
    # graph.edge('GPT_1', 'GPT_2')
    # graph.edge('GPT_2', 'GPT_2')
    # graph.edge('System', 'GPT_2')
    # graph.edge('GPT_2', 'Text2Video')
    # graph.edge('Text2Video', 'UI')
    # graph.edge('UI', 'User')

    col1, col2,_ = st.columns(3)
    # col1.graphviz_chart(graph)
    col2.write("This is a highlevel chart of how our application is set up")
    col2.write("""
    First, the user inputs a query for a certain dish, country, or simply nothing.
    A list of dishes based on the users interests are then created.
    LLMs are used to structure recipe into Ingredients, and Instructions
    The LLMs are also used as self-supervisors where they re-prompt themselves for feedback and idea validation
    Instructions are used to generate a text2video prompt by another LLM, using the same self feedback loop
    Prompts are then used to generate a video for each instruction.
    An algorithm puts the videos together with Ai generated Audio and sends it back to the user
""")
    
    st.divider()
    _,title,_ = st.columns(3)
    title.title("Team Members")
    team1, team2, team3, team4 = st.columns(4)
    team1.image("Streamlit/Assets/Images/bethany.jpg")
    team1.write("Ali Mokni")

    team2.image("Streamlit/Assets/Images/bethany.jpg")
    team2.write("Bethany Wong")

    team3.image("Streamlit/Assets/Images/heidi.jpg")
    team3.write("Heidi Albarazi")

    team4.image("Streamlit/Assets/Images/mostafa.jpg")
    team4.write("Mostafa ElHayani")
    
    st.divider()
    _,image_col, _ = st.columns(3)
    image_col.image("Streamlit/Assets/Images/socialsQR.jpeg")
    image_col.write("Follow our socials!")
    