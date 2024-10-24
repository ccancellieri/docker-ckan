#!/bin/bash
# sudo chown -R ckan:ckan ${APP_DIR}/src_extensions/
pip install --upgrade pip setuptools &&\
pip install wheel

pip install Flask-DebugToolbar==0.10.1 --upgrade
#Flask-DebugToolbar==0.10.1
# Flask-DebugToolbar==0.13.1