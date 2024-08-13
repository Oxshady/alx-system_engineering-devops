#!/usr/bin/python3
"""fetching title of 10 hot posts
from reddit api"""
import requests


def top_ten(subreddit):
    """titles of hot posts"""
    url = f"https://www.reddit.com/r/{subreddit}/hot.json"
    headers = {"User-Agent": "python-requests/2.32.3"}
    params = {"limit": 10}
    res = requests.get(url=url, headers=headers, params=params)
    try:
        data = res.json()['data']['children']
    except KeyError:
        print("None")
        return
    for obj in data:
        print(obj.get('data').get('title'))
