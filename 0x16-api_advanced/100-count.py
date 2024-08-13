#!/usr/bin/python3
"""
recursively query api
"""
import requests
import re


def count_words(subreddit, word_list, after=None, word_count=None):
    """
    recursively query api
    """
    if word_count is None:
        word_count = {word.lower(): 0 for word in word_list}
    url = f"https://www.reddit.com/r/{subreddit}/hot.json"
    headers = {'User-Agent': 'python-requests/2.32.3'}
    params = {'limit': 100}
    if after:
        params['after'] = after
    response = requests.get(
        url,
        headers=headers,
        params=params,
        allow_redirects=False
        )
    if response.status_code != 200:
        return
    data = response.json()
    if 'data' not in data or 'children' not in data['data']:
        return
    articles = data['data']['children']
    for article in articles:
        title = article['data']['title'].lower()
        for word in word_count:
            word_pattern = re.compile(r'\b{}\b'.format(
                re.escape(word)), re.IGNORECASE)
            word_count[word] += len(word_pattern.findall(title))
    after = data['data'].get('after')
    if after:
        count_words(subreddit, word_list, after, word_count)
    else:
        sorted_counts = sorted(word_count.items(), key=lambda x: (-x[1], x[0]))
        for word, count in sorted_counts:
            if count > 0:
                print(f"{word}: {count}")
