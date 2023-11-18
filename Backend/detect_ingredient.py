import base64
import requests

api_key = "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"


def get_recipe(base64_image, exclude_list=[], include_list=[]):

  headers = {
    "Content-Type": "application/json",
    "Authorization": f"Bearer {api_key}"
  }

  prompt = "what are the ingredients and keywords if i want to recreate this dish, return only the ingredients and keywords as a string without title. give me a recipe for this"
  if len(exclude_list) > 0:
    prompt += " without"
  for str in exclude_list:
    prompt += f" {str},"
  if len(include_list) > 0:
    prompt += " but with "
  for str in include_list:
    prompt += f"{str}, "

  payload = {
    "model": "gpt-4-vision-preview",
    "messages": [
      {
        "role": "user",
        "content": [
          {
            "type": "text",
            "text": prompt
          },
          {
            "type": "image_url",
            "image_url": {
              "url": f"data:image/jpeg;base64,{base64_image}"
            }
          }
        ]
      }
    ],
    "max_tokens": 300
  }

  response = requests.post("https://api.openai.com/v1/chat/completions", headers=headers, json=payload)

  return response.json()['choices'][0]['message']['content']



def encode_image(image_path):
  with open(image_path, "rb") as image_file:
    return base64.b64encode(image_file.read()).decode('utf-8')

def get_recipe_path(image_path, exclude_list=[], include_list=[]):

  base64_image = encode_image(image_path)

  headers = {
    "Content-Type": "application/json",
    "Authorization": f"Bearer {api_key}"
  }

  prompt = "what are the ingredients and keywords if i want to recreate this dish, return only the ingredients and keywords as a string without title. give me a recipe for this"
  if len(exclude_list) > 0:
    prompt += " without"
  for str in exclude_list:
    prompt += f" {str},"
  if len(include_list) > 0:
    prompt += " but with "
  for str in include_list:
    prompt += f"{str}, "

  payload = {
    "model": "gpt-4-vision-preview",
    "messages": [
      {
        "role": "user",
        "content": [
          {
            "type": "text",
            "text": prompt
          },
          {
            "type": "image_url",
            "image_url": {
              "url": f"data:image/jpeg;base64,{base64_image}"
            }
          }
        ]
      }
    ],
    "max_tokens": 300
  }

  response = requests.post("https://api.openai.com/v1/chat/completions", headers=headers, json=payload)

  return response.json()['choices'][0]['message']['content']

#image_path = "cheesy_onion_chicken_small.jpg"
#print(get_recipe(image_path, ["bell pepper", "meat"], ["garlic"]))