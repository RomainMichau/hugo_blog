---
title: "How to deploy my Hugo website using docker and ansible"
date: 2023-08-02T19:21:40+02:00
draft: true
author: Romain Michau (romain9692@gmail.com)
---

# What is hugo ?
![hugo logo](https://d33wubrfki0l68.cloudfront.net/c38c7334cc3f23585738e40334284fddcaf03d5e/2e17c/images/hugo-logo-wide.svg)
[Hugo](https://gohugo.io/) is a popular open source static site generator written in Go.  
It basically convert markdown into a nice HTML page (like the one that you are reading).  
It is very useful to simple usage like writting a blog or a documentation. 
Since Hugo does not requires to be a HTML/CSS/JS ninja for a basic usage pretty much anyone can use it and is a nice alternative to more complex solutions like wordpress or plume which will need to have a SQL storage. It is also worthy to note that 
Hugo is very well documented.

# That's nice, but how do I serve it ? 
- First we will create a DockerFile to build an Image to server your Hugo website  
- Then we will use ansible to deploy this image on a linux server
## Prerequistes 
For this tutorial you will need to have the followings tools installed and working on your box:
- [Hugo](https://gohugo.io/installation/)
- [Docker](https://docs.docker.com/engine/install/)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

## Create a dummy hugo website
For the needs of this tutorial we will create a dummy Hugo website by following the [QuickStart tuto of Hugo](https://gohugo.io/getting-started/quick-start/). 

### Create a dummy hugo webiste
Let's use Hugo to create the skeleton of our webiste:
```bash
hugo new site my_dummy_website
cd my_dummy_website
git init
git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke.git themes/ananke
echo "theme = 'ananke'" >> hugo.toml
hugo new posts/my-first-post.md
hugo server -D -p 1234
```
By accessing http://localhost:1234/ on your browser you should see the webiste  
Hugo CLI as a build feature which allow you 

### Write a Dockerfile to run your app in a docker container
To do that we will rely on the [klakegg/hugo](https://hub.docker.com/r/klakegg/hugo) docker image 
