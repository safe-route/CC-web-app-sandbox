# Safe Route Web Interface

A simple web application for interacting with API's and map library. Built with flask.

## Overview

This is a simple flask web server that aims to provide an early sandbox or testing ground to fully integrate feature, testing them, and adding new features.

### Stack

#### Leaflet

an open-source JavaScript library for interactive web maps. Chosen because the [high popularity](https://stackshare.io/leaflet#description), second to Google maps.

#### Flask

Microweb framework written in python, as web server refer to [documentations](https://flask.palletsprojects.com/en/2.1.x/)

## Editing Web App

`app.py` is where the backend logic happens, `html & css` files are put in `templates` and `static` respectively. the route renders `.html pages` with `return render_template <html file>`. For starter please read [Leaflet js quick start guide](https://leafletjs.com/)

## Running Web App

Set up a python virtual environmet first with `python3 -m venv .venv` then `source .venv/bin/activate`. After that install requirements first with `pip install requirements.txt` then `flask run` command after cloning repository, go to specified port to see the web app.