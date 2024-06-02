# 0x09-web_infrastructure_design

This repository contains various web infrastructure designs for hosting the website www.foobar.com. The designs evolve from a simple single-server setup to a secured and monitored multi-server architecture. Each design aims to address specific needs and issues in web infrastructure management.

## Table of Contents
1. [Simple Web Stack](#simple-web-stack)
2. [Distributed Web Infrastructure](#distributed-web-infrastructure)
3. [Secured and Monitored Web Infrastructure](#secured-and-monitored-web-infrastructure)
4. [Scale Up](#scale-up)

### Simple Web Stack

**File:** `0-simple_web_stack`

This design outlines a basic web infrastructure consisting of a single server that hosts the website www.foobar.com.

#### Requirements:
- 1 server
- 1 web server (Nginx)
- 1 application server
- 1 application files (your code base)
- 1 database (MySQL)
- 1 domain name `foobar.com` configured with a `www` record pointing to server IP `8.8.8.8`

#### Explanation:
- **Server:** A physical or virtual machine that runs the web infrastructure components.
- **Domain Name:** `foobar.com` maps human-readable names to IP addresses, allowing users to access the website easily.
- **DNS Record:** The `www` in `www.foobar.com` is a CNAME (Canonical Name) record pointing to the server's IP.
- **Web Server:** Nginx serves static content and forwards dynamic requests to the application server.
- **Application Server:** Processes dynamic content using the code base.
- **Database:** MySQL stores and manages data.
- **Communication:** HTTP/HTTPS protocol for communication between the server and the user's computer.

#### Issues:
- **SPOF:** Single Point of Failure - if the server fails, the website is inaccessible.
- **Downtime:** Maintenance or code deployment requires restarting the server, leading to downtime.
- **Scalability:** Cannot handle high traffic as it relies on a single server.

### Distributed Web Infrastructure

**File:** `1-distributed_web_infrastructure`

This design introduces multiple servers and a load balancer to distribute the traffic, enhancing the infrastructure's reliability and scalability.

#### Requirements:
- 2 servers
- 1 web server (Nginx)
- 1 application server
- 1 load-balancer (HAproxy)
- 1 set of application files (your code base)
- 1 database (MySQL)

#### Explanation:
- **Load Balancer:** Distributes incoming traffic across multiple servers using a specific algorithm (e.g., round-robin).
- **Active-Active vs Active-Passive:** Active-Active allows both servers to handle requests simultaneously. Active-Passive has one server on standby.
- **Database Cluster:** Primary-Replica setup where the Primary node handles writes and Replicas handle reads to distribute the load.

#### Issues:
- **SPOF:** The load balancer can be a single point of failure.
- **Security:** Lack of firewalls and HTTPS can lead to vulnerabilities.
- **Monitoring:** No monitoring setup to track the health and performance of the infrastructure.

### Secured and Monitored Web Infrastructure

**File:** `2-secured_and_monitored_web_infrastructure`

This design adds security and monitoring to the distributed web infrastructure, ensuring secure communication and better management.

#### Requirements:
- 3 firewalls
- 1 SSL certificate for HTTPS
- 3 monitoring clients (data collector for Sumologic or other services)

#### Explanation:
- **Firewalls:** Protect the servers by filtering incoming and outgoing traffic based on security rules.
- **HTTPS:** SSL certificate encrypts traffic, ensuring secure communication.
- **Monitoring:** Tools like Sumologic collect data on server performance and health, helping in proactive issue resolution.

#### Issues:
- **SSL Termination:** At the load balancer level can be less secure.
- **Single MySQL Server:** Limits write operations, creating a bottleneck.
- **Homogeneous Components:** All servers having the same components can lead to resource contention and performance issues.

### Scale Up

**File:** `3-scale_up`

This design focuses on scaling up the infrastructure by further distributing components and adding redundancy.

#### Requirements:
- 1 server
- 1 load-balancer (HAproxy) configured as a cluster with the existing one
- Split components (web server, application server, database) to separate servers

#### Explanation:
- **Load Balancer Cluster:** Enhances availability and load distribution.
- **Component Distribution:** Separates the web server, application server, and database to dedicated servers to improve performance and scalability.

## Conclusion
This repository provides a guide to designing scalable, secure, and efficient web infrastructures. Each design is a step towards building robust systems capable of handling increasing traffic while maintaining high availability and security.
