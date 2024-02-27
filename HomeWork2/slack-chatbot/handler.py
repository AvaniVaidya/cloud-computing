import datetime
import random
from urllib2 import urlopen
from urllib import urlencode, unquote

name_responses = ["Avani is my name", "My name is Avani's chatbot", "You can call me by the name Avani"]
currentdt = datetime.datetime.now()
date_time_responses = ["Date-time now is " + currentdt.strftime("%m-%d-%Y:%H:%M:%S"), "Currently the date and time at your location is " + currentdt.strftime("%m-%d-%Y:%H:%M:%S"), "Today's date and time right now is " + currentdt.strftime("%m-%d-%Y:%H:%M:%S")]
random_ind = random.randint(0,2)

def invoke_figlet(text):
    figletUrl = "http://10.62.0.1:8080/function/figlet"
    try:
        post_data = text.split("for", 1)[1].strip()
        fig_response = urlopen(figletUrl, post_data)
        return fig_response.read()
    except Exception as e:
        return None

def handle(req):
    user_input = req.strip().lower()
    if "name" in user_input:
        response = random.choice(name_responses)
        return response
    elif "time" in user_input or "date" in user_input:
        response = random.choice(date_time_responses)
        return response
    elif "figlet" in user_input:
       figlet_response = invoke_figlet(req.strip())
       if figlet_response:
           response = figlet_response
           return response
       else:
           response = "Cannot generate figlet"
           return response
    else:
        return "Something went wrong"
