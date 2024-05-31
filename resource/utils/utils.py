import requests
import os

from dotenv import load_dotenv
from robot.api.deco import keyword

load_dotenv()

@keyword('Get Stone Auth Token')
def get_stone_token():

    payload = f"client_id=admin-cli&username={os.getenv('LOGIN_SANDBOX', None)}&password={os.getenv('PASSWORD_SANDBOX', None)}&grant_type=password"

    headers = {
        'Content-Type': 'application/x-www-form-urlencoded'
    }

    response = requests.request("POST",  os.getenv('SANDBOX_LOGIN_URL', None), headers=headers, data=payload)
    response.raise_for_status()

    return f"{response.json()['token_type']} {response.json()['access_token']}"
