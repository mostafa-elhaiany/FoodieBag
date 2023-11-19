

def draw_sidebar(st):
    st.sidebar.title("Navigation")
    page = st.sidebar.selectbox("Choose a page", ["Home", "Create", "Personalize" ,"About"])
    st.sidebar.title("")

    st.sidebar.title("Preferences")
    tags = st.sidebar.multiselect(
        "Select tags:",
        ["Vegan", "Vegetarian", "Gluten-free", "Lactose-free", "Dessert", "Baked"]
    )
    return page, tags