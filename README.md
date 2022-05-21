# Safe Route Web Interface

A simple web application for interacting with API's, map library, and testing stuff before being implemented. Built with flask, which used python so that nearly anyone can try their implementation before going to prod.

## Overview

This is a simple flask web server that aims to provide an early sandbox or testing ground to fully integrate feature, testing them, and adding new features.

## Stack

- Leaflet: an open-source JavaScript library for interactive web maps. Chosen because the [high popularity](https://stackshare.io/leaflet#description), second to Google maps.

- Flask: Microweb framework written in python, as web server refer to [documentations](https://flask.palletsprojects.com/en/2.1.x/)

## Editing The Web App

Server stuff are all of the files not located in `templates` and `static`, if you don't want to modify the web server please only modify files that are located in those two directories mentioned above. For rundown of each specific files in case you **DO** wanted to edit it:

  - `app.py` is the main server file, simply said it will handle the route request from both methods, modify this if you wanted to create an additional variable or parameters passed to the backend.
  - `.env` is an environment data, can be said with `ENV` inside your own shell instead. For consistency leave this untouched, unless you are modifying this web server to production ready.
  - `config.py` as the name implies this file contains the configs for flask, leave be if you do not need specific configuration changed.
  - `wsgi.py` for gunicorn WSGI entrypoint, to serve as a deployemnt entry point, leave untouched as you are using `flask` development server to run the web app.

As for the interface which is served with simple HTML, CSS, and JS. go to `/web-app-sandbox/templates.` for editing the pages served on server, `/web-app-sandbox/static/.` this folder stores the additional "static" files, put additional content here such as json, images, and else here **for now**.

Flask use **jinja** (refer to docs), so you only need to edit the **index.html** file, no need to touch the **layout html**.


## Running Web App

Set up a python virtual environmet first with `python3 -m venv .venv` then `source .venv/bin/activate`. After that install requirements first with `pip install requirements.txt` then `flask run` command after cloning repository, go to specified port in your browser to see the web app.

**OR**

If you have docker installed `docker build <directory to project> -t <image-name>` and then after finished `docker run -it -p 5000:5000 safe-route-web:0.1`