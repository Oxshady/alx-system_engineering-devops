#!/usr/bin/python3
"""recursion ^_^ """
import requests
def recurse(subreddit, hot_list=[], after=None):
    """titles of hot posts"""
    url = f"https://www.reddit.com/r/{subreddit}/hot.json"
    headers = {"User-Agent": "python-requests/2.32.3"}
    if after:
        res = requests.get(url=url, headers=headers, params={"after":after})
    else:
        res = requests.get(url=url, headers=headers)
    if res.status_code == 200:
        data = res.json()
        after = data['data']['after']
        for ob in data['data']['children']:
            hot_list.append(ob.get('data').get('title'))
        if after:
            return recurse(subreddit=subreddit, hot_list=hot_list, after=after)
        else:
            return hot_list
