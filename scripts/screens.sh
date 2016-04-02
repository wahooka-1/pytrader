#!/bin/bash

####################
# Script to start some processes of pytrader like a service in screen terminals
####################

####################
# Configuration

# location of pytrader directory

PYTRADERHOME="~/pytrader"

# IP address and port to bind the django server
# PYTRADERBIND="" # Use default value 127.0.0.1:8000
# PYTRADERBIND="45.34.34.12:80" # Use a specific IP address and port

PYTRADERBIND=""

# Configuration
####################

screen -d -m -S predictNN bash -c 'while true; do cd ${PYTRADERHOME} ; ./manage.py predict_many_v2; done'
screen -d -m -S predictSK bash -c 'while true; do cd ${PYTRADERHOME} ; ./manage.py predict_many_sk; done'
screen -d -m -S trade bash -c 'while true; do cd ${PYTRADERHOME} ; ./manage.py trade; done'
screen -d -m -S runserver bash -c 'while true; do cd ${PYTRADERHOME} ; ./manage.py runserver ${PYTRADERBIND} ; done'

screen -list
