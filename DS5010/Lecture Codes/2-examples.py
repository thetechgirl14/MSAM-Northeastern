
# Lecture examples for "2-Basics"

print("Hello, world!")


# Variable

pi = 3.14159265358979

radius = 2.22

area = pi * (radius ** 2)

area

radius = radius * 2

a = 3

b = a

string1 = "Hello"

string2 = "world"

year = 2021

string1 + " " + string2

string1 * 3

string1 + 3

string1 = 500

s = "Hello, world!"

s[0]

s[1]

s[-1]

s[-2]

len(s)

# types - int

a = 1

b = 2

year = 2021

c = -365

int(3.3)

# types - float

a = 1.

b = 3.14

c = -123.456

float(3)

# arithmetic

2 / 3

2 // 3

2 % 3

4 % 3

2 ** 3

# comparison

1 == 1

2 > 1

"b" > "a"

1 != 1

True and True

True and False

True or False

not True

# None

None

type(None)

nn = None

nn

type(nn)

# lists

[]

type([])

[1, 2, 3]

[1.11, 2.22, 3.33]

[1, 2.22, "hello"]

[[1.11, 2.22, 3.33], ["Hello", "world!"]]

colors = ["red", "green", "blue", "alpha"]

colors[0]

colors[1]

colors[0:3]

colors[1:4]

colors[:2] # first 2 elements

colors[:3] # first 3 elements

colors[:4]

colors = ["red", "green", ["blue", "cyan", "indigo"]]

colors[0]

colors[2]

colors[2][0]

colors[-1]

colors[-2]

len(colors)

colors[0:2]


powers = [1, 2, 4, 8, 16, 32, 64]

powers[0]

powers[1]

powers[-1]

powers[:4] # first 4 elements

powers[4:] # everythings after the 4 elements

powers[-4:] # last 4 elements

powers[1:-1] # seconds to second-to-last

a = [1, 2, 3]

b = [4, 5, 6]

a + b

a * 3

# list methods

fib = [1, 1, 2, 3, 5, 8, 13, 21, 34]

fib[:5]

type(fib[:5])

fib.append(55)

fib

fib.extend([89, 144])

fib.index(8)

fib[5]

fib.count(1)

# tuples

()

type(())

a = (1,)

type(a)

a2 = (1,)

type(a2)

len(a)

b = ("red", "blue", 1, 2)

c = "red", "blue", 1, 2

b[0] # string

type(b[0]) # string

b[2] # int

type(b[2]) # int

type(b[:3]) # typle


# mutable list

a = [1, 2, 3]

b = a

a[1] = 100

a

b

a is b


L = [3, 2, 1]

sorted(L)

L

L.sort()

L

# dict

{}

me = {"Name": "Kylie", "Age": 31}

me.keys()

me.values()

me["Name"]

me["Age"]

me[0] # doesn't exist

me = {"Name": "Kylie", "Age": 31, 0: "zero"} # add key-value for 0

"Name" in me

# set

set()

type(set())

a = {1, 2, 3}

len(a)

b = {1, 1, 2, 3}

len(b)

b

c = {1, 1, 1, 1}

len(c)

2 in a

# loops

while True:
	print("Ctrl-C to escape!")


i = 0
while i < 5:
	print(i)
	i = i + 1


for i in range(5):
	print(i)


a = ["red", "blue", 1, 2,]

for i in a:
	print(i)

# files

f = open("mtcars.csv")

content = f.read()

content

line1 = f.readline()
line2 = f.readline()
line3 = f.readline()

line1
line2
line3

lines = f.readlines()
len(lines)

lines[0]
lines[1]
lines[2]

f.close()

with open("mtcars.csv") as f:
	for line in f:
		print(line)






