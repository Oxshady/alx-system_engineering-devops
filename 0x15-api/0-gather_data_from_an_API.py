#!/usr/bin/python3
""" script that, using this REST API, for a given employee ID,
returns information about his/her TODO list progress."""
import requests
from sys import argv

tasks = 0
comp = 0
titles = []
getname = 0
username = ""
url = "https://jsonplaceholder.typicode.com/todos/"
res = requests.get(url=url)
todolist = res.json()
url = url.replace("todos/", "users/")
for todo in todolist:
    if todo.get("userId") == int(argv[1]):
        tasks += 1
        if getname == 0:
            getname = 1
            url += f"{argv[1]}"
            res = requests.get(url=url)
            res = res.json()
            username = res.get("name")
        if todo.get("completed") is True:
            comp += 1
            titles.append(todo.get("title"))
if __name__ == "__main__":
    print(f"Employee {username} is done with tasks({comp}/{tasks}):")
    for title in titles:
        print(f"\t {title}")
