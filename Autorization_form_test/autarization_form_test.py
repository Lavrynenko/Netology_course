import requests
user = str(input('User?: '))
password = str(input(('Pass?: ')))
r = requests.get('https://api.github.com', auth=(user, password))

print (r.status_code)
print (r.headers['content-type'])