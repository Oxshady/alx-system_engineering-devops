#!/usr/bin/python3
""" as i did in 0-gather_Data_from_an_API module
but extend Python script to export data in the CSV format."""
import requests
from sys import argv

tasks = 0
titles = []
getname = 0
username = ""
url = "https://jsonplaceholder.typicode.com/todos/"
res = requests.get(url=url)
if res.status_code != 200:
    exit()
todolist = res.json()
url = url.replace("todos/", "users/")
for todo in todolist:
    try:
        if todo.get("userId") == int(argv[1]):
            tasks += 1
            if getname == 0:
                getname = 1
                url += f"{argv[1]}"
                res = requests.get(url=url)
                if res.status_code != 200:
                    continue
                res = res.json()
                username = res.get("name")
            if todo.get("completed") is True:
                titles.append((True, todo.get("title")))
    except Exception:
        pass
if __name__ == "__main__":
    i = 0
    for completed, title in titles:
        print(f'"{argv[1]}","{username}","{completed}","{title}"')
        i += 1
        # print(f'"{argv[1]}",""')
