import requests
import config
key = config.RECIPE_API 
query = 'italian wedding soup'
api_url = 'https://api.api-ninjas.com/v1/recipe?query={}'.format(query)
response = requests.get(api_url, headers={'X-Api-Key': key})
if response.status_code == requests.codes.ok:
    print(response.text)
else:
    print("Error:", response.status_code, response.text)