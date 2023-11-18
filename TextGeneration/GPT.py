import openai
import config

def generate_recipe_structure(recipe_text, agent=None):
    if(agent is None):
        client = openai.OpenAI(api_key=config.OPENAI_API)
    response = client.chat.completions.create(
        messages=[
            {
                "role": "system",
                "content": config.RECIPE2INSTRUCTIONS
            },
            {
                "role": "user",
                "content": recipe,
            }
        ],
        model="gpt-3.5-turbo",
        # stream=True,
        max_tokens=200
    )
    # for part in response:
    #     print(part.choices[0].delta.content or "")
    # result = response['choices'][0]['text']
    result = response.choices.content
    instructions = result.split('\n')[1:-1]  # Extract instructions, excluding the prompt and empty lines
    return instructions

def generate_prompts(recipe_instructions, agent=None):
    if(agent is None):
        client = openai.OpenAI(api_key=config.OPENAI_API)
    response = client.chat.completions.create(
        messages=[
            {
                "role": "system",
                "content": config.INSTRUCTIONS2VIDEO
            },
            {
                "role": "user",
                "content": recipe_instructions,
            }
        ],
        model="gpt-3.5-turbo",
        # stream=False,
        max_tokens=200
    )
    # for part in response:
    #     print(part.choices[0].delta.content or "")
    # result = response['choices'][0]['text']
    result = response.choices.content
    instructions = result.split('\n')[1:-1]  # Extract instructions, excluding the prompt and empty lines
    return instructions


if __name__ == "__main__":
    # Example usage
    recipe = """
    Name: Delicious Pasta
    Ingredients:
    - 2 cups pasta
    - 1 cup tomato sauce
    - 1/2 cup grated cheese
    Instructions:
    1. Boil pasta in salted water.
    2. Drain the pasta and mix with tomato sauce.
    3. Top with grated cheese.
    4. Bake in the oven until cheese is melted and bubbly.
    5. Enjoy your delicious pasta!
    """

    structured_instructions = generate_recipe_structure(recipe)
    # for i, instruction in enumerate(structured_instructions, start=1):
    #     print(f"{i}. {instruction.strip()}")


