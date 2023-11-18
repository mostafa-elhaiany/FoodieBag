from dotenv import load_dotenv
import os

load_dotenv()

RECIPE_API = os.getenv('recipeAPI')
OPENAI_API = os.getenv('openAi')