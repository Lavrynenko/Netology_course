import json

# save
data = ['Test data', {'Structure':'Any'} ]
json.dump(data, open('test.json', 'w'))

# load
data = json.load( open('test.json', 'r') )
print(data)