#!/usr/bin/python3
"""fetching data from reddit api"""
import requests


def number_of_subscribers(subreddit):
    """number of subscribers"""
    if subreddit is None or not isinstance(subreddit, str):
        return 0
    url = f"https://www.reddit.com/r/{subreddit}/about.json"
    headers = {"User-Agent": "python-requests/2.32.3"}
    res = requests.get(url=url, headers=headers)
    if res.status_code == 200:
        try:
            return res.json()['data']['subscribers']
        except KeyError:
            pass
    return 0
