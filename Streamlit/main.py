# hello_world.py
import streamlit as st
import Sidebar, Home, About, Create, Personalization

def main():
    page, tags = Sidebar.draw_sidebar(st)

    if page == "Home":
        Home.draw_home(st, tags)
    elif page == "About":
        About.draw_about(st)
    elif page == "Contact":
        pass
    elif page == "Create":
        Create.draw_create(st)
    elif page == "Personalize":
        Personalization.draw_personalize(st)
if __name__ == "__main__":
    main()
