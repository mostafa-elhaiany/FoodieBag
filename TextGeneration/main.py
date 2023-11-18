import RecipeGeneration, GPT
import json

dish = "Italian Pasta"

recipe = RecipeGeneration.get_recipe(dish)
recipe = json.loads(recipe)

instructions = recipe[2]["instructions"]
print(instructions)
# structured_instructions = GPT.generate_recipe_structure(instructions)

# video_prompts = GPT.generate_prompts(structured_instructions)
