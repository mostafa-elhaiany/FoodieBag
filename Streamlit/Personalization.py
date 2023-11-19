from PIL import Image
import base64
from io import BytesIO
import time

def get_base64_image(image):
    # Open the image using PIL
    pil_image = Image.open(image)

    # Convert PIL image to base64-encoded string
    buffered = BytesIO()
    pil_image.save(buffered, format="JPEG")  # You can change the format as needed
    encoded_image = base64.b64encode(buffered.getvalue()).decode("utf-8")

    return encoded_image


def draw_personalize(st):
    st.title("Recipe Personalization")
    st.write("See a dish you like that you'd love to know how to cook?")
    st.write("Upload a picture and we'll tell you how to make it.")
    st.write("Want to change something about it? let us know and we'll do that for you too")

    st.divider()

    # Upload image through file uploader
    uploaded_file = st.file_uploader("Choose an image...", type=["jpg", "jpeg", "png"])

    if uploaded_file is not None:
        # Display the uploaded image
        st.image(uploaded_file, caption="Uploaded Image", use_column_width=True)

        # Convert the image to base64
        encoded_image = get_base64_image(uploaded_file)

        # # Display the base64-encoded string
        # st.write("Base64 Encoded Image:")
        # st.text(encoded_image)

        st.divider()

        st.title("AI outputs")
        st.code("""
        {
            dish: "Chinese BBQ sauce"
            ingredients: [
                "1/2 cup Sherry",
                "4 Cloves garlic",
                "6 tablespoons Soy sauce",
                "2 teaspoons Plum sauce",
                "2 tablespoons Black bean paste",
                "6 tablespoons Hoisin sauce",
                "2 teaspoons Salt",
                "1 1/2 teaspoons Chinese 5-spice",
                "1/2 cup Sugar"
            ],
            servings: "13 Servings",
            instructions: "Mix together well. Heat in a double boiler - add cornstarch for thickening."
        }
        """)

        generate = st.button("Generate Video")
        if(generate):
            with st.spinner():
                for _ in range(10):
                    time.sleep(0.2)
            st.video("Streamlit/Assets/Videos/video1.mp4")



    