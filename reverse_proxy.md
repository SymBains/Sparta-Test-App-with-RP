# Reverse Proxy

## What is a reverse proxy? 
A reverse proxy is like a middleman between users and a web server. When you visit a website, instead of directly connecting to the server hosting the site, your request goes through the reverse proxy first. The proxy then forwards the request to the actual server, gets the response, and sends it back to you.

### Why implement one?
#### Security
- The Node.js app is running on port 3000, exposing this directly could be risky. 
- NGINX acts as a shield, hiding the internal service and allowing only controlled access.
#### Port Forwarding
- By default, Node.js apps run on non-standard ports (e.g., `3000`).
- Instead of users needing to access `http://your-server-ip:3000`, NGINX can route requests from `http://your-server-ip` (port 80) to the Node.js app.
#### Load Balancing
- If you scale the app with multiple instances, NGINX can distribute traffic evenly.

## How are they different to a forward proxy?
### Reverse Proxy
- Sits in front of servers and handles client requests on their behalf.
- Clients don’t know which server they are actually talking to.
- Used for security, load balancing, caching, and SSL termination.
  
**Example:** NGINX or Apache acting as a reverse proxy for a Node.js app.

**Who benefits?** The server (by reducing load, adding security, etc.).

### Forward Proxy
- Sits in front of clients and forwards their requests to the internet.
- The destination server sees the request coming from the proxy, not the client.
- Used for privacy, content filtering, and bypassing restrictions.

**Example:** A company using a proxy to restrict employees from accessing social media.

**Who benefits?** The client (by hiding their identity or controlling access).

### Analogy
- A reverse proxy is like a receptionist—you ask them for information, and they fetch it from the right department (server).

- A forward proxy is like a VPN—you tell it where you want to go, and it hides your identity while getting the info.

## How do they work? Add a diagram if possible
![Forward Proxy vs Reverse Proxy](https://miro.medium.com/v2/resize:fit:1400/0*q3WQYeqTRt8g_Kit.jpeg)
