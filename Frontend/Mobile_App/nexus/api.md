*url = 127.0.0.1:8000* for now

## register

url/register  post method

request in json containing:
first_name
last_name
username
email
phone
password

## login 
url/login post method

request in json containing:

email
password

## logout

url/logout      post method

## user profile

url/user-profile get method

response in json containing:

first_name
last_name
username
email
phone
profile_picture
## update profile

url/update-profile       post method

request in json containing:

username
email
profile_picture



## view mind-map space

url/user/{user_id}/index  get method

response in json containing:

id
title
connections
positions

## view a specific mind-map

url/user/{user_id}/show/{id}   get method

response in json containing:

title
content
editable

## store a mind-map

url/user/{user_id}/store   post request

request in json containing:


title
content -> nullable
connections -> nullable
positions -> unique
editable



## update a mind-map


user/user/{user_id}/edit/{id}  patch method

request in json containing:


title
content -> nullable
connections -> nullable
positions -> unique
editable

## delete a mind-map

url/user/{user_id}/delete/{id} delete method