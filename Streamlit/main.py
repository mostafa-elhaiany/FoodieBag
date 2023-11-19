# hello_world.py
import streamlit as st
import Sidebar, Home, About, Create, Personalization, Ingredients

def main():
    page, tags = Sidebar.draw_sidebar(st)

    _, title, _ = st.columns(3)
    title.title("FoodieBag")

    if page == "Home":
        Home.draw_home(st, tags)
    elif page == "About":
        About.draw_about(st)
    elif page == "Ingredients":
        Ingredients.draw_ingredients(st)
    elif page == "Create":
        Create.draw_create(st)
    elif page == "Personalize":
        Personalization.draw_personalize(st)
if __name__ == "__main__":
    main()
