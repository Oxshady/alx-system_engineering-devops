#!/usr/bin/python3
""" script that, using this REST API, for a given employee ID,
returns information about his/her TODO list progress."""
import requests
from sys import argv

url = "https://jsonplaceholder.typicode.com/todos/"
todo = requests.get(url=url).json()
user = requests.get(url=f"https://jsonplaceholder.typicode.com/users/{argv[1]}")
user = user.json().get('username')
data = []
for toodo in todo:
    if str(toodo.get("userId")) == argv[1]:
        data.append((toodo.get("completed"),toodo.get("title")))

for comp, title in data:
    with open(f"{argv[1]}.csv",'a') as csvf:
        data = f'"{argv[1]}","{user}","{comp}","{title}"\n'
        csvf.write(data)
