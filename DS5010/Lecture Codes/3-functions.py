
# Lecture examples for "3-Functions"

### Iteration

while True:
	print("Ctrl-C to escape!")

i=0
while i < 5:
	print(i)
	i = i + 1

for i in range(5):
	print(i)

# iterating a file (readline)

f = open("mtcars.csv")

data = []

line = f.readline()
while line:
	data.append(line.split(","))
	line = f.readline()

f.close()
data

# iterating a file (iterator)

f = open("mtcars.csv")

data = []

I = iter(f)
while True:
	try:
		line = next(I)
	except StopIteration:
		break
	data.append(line.split(","))

f.close()
data

# iterating a file (for loop)

f = open("mtcars.csv")

data = []

for line in f:
	data.append(line.split(","))

f.close()
data

# using range()

for i in range(10):
	print(i)

for i in range(int(1e12)):
	print(i)

# using enumerate()

lst = ["red", "green", "blue"]

for i, elt in enumerate(lst):
	print(i, ":", elt)

# using zip()

hotpink = {"red": 255, "green": 105, "blue": 180}

for col, val in hotpink.items():
	print(col, ":", val)

colors = ["red", "green", "blue"]
values = [255, 105, 180]

for col, val in zip(colors, values):
	print(col, ":", val)

colors2, values2 = zip(*hotpink.items())

### Comprehensions

# motivation

lst = [1, 2, 3, 4, 5, 6]

out = []
for x in lst:
	out.append(x ** 2)

out

# list comprehension

lst = [1, 2, 3, 4, 5, 6]

[x ** 2 for x in lst]

lst = [1, 2, 3, 4, 5, 6]

[x for x in lst if x % 2 == 0]



### Functions

# mysum()

y = 100

def mysum(x):
	"""
	Sums values of an iterable
	param x: An iterable to sum the values
	returns: The sum
	"""
	xsum = 0
	for xi in x:
		xsum += xi
	return xsum


