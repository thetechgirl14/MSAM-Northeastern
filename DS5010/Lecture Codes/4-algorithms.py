
### Scope


X = 99

def func(Y): # Local: Y and Z assigned in def
	Z = X + Y # Accesses global X
	X = -99
	return Z

func(1)

def outer(X):
	Z = 100

	def inner():
		Y = -99
		return X + Z
	
	# print(Y)
	return inner

f = outer(1)

f()


### Default parameter values

def add(X = 1, Y = 2):
	return X + Y

add(3, 4)

add()

add(Y=1)

add(X=3, Y=4)

def grow(X, L = []):
	L.append(X)
	print(L)

grow(1)
grow(2)
grow(3)
grow(4)
grow(5)

### Recursion + memoization

# Factorial

def fact(n):
	"""
	Factorial of n (i.e., n!)
	param n: A number
	returns: Factorial of n
	"""
	if n == 1:
		return 1
	else:
		return n * fact(n-1)

fact(1)
fact(5) # 120
fact(6) # 720
fact(9) # 362880
fact(450) # 1.73e1000
fact(1000) # 4.02e2567

# Factorial w/ memo

def factn(n, memo={}):
	"""
	Factorial of n (i.e., n!)
	param n: A number
	returns: Factorial of n
	"""
	if n == 1:
		return n
	elif n not in memo:
		memo[n] = n * factn(n-1)
	return memo[n]

factn(1)
factn(5) # 120
factn(6) # 720
factn(9) # 362880
factn(450) # 1.73e1000
factn(1000) # 4.02e2567

def grow(a, memo=[]):
	memo.append(a)
	return memo

# Factorial w/ iteration

def facti(n, memo={}):
	if n == 1:
		return 1
	if n not in memo:
		prod = 1
		for i in range(1, n+1):
			prod *= i
		memo[n] = prod
	return memo[n]

### Sorting

# Selection sort

def swap(x, i, j):
	"""
	Swaps two elements of a list
	param x: The list (or other mutable sequence)
	param i: Offset of the first element
	param j: Offset of the second element
	returns: None
	"""
	temp = x[i]
	x[i] = x[j]
	x[j] = temp

def ssort(x):
	"""
	Sorts a list of numbers in-place using selection sort
	param x: The list to sort (in place)
	returns: None
	"""
	for i in range(len(x)):
		imin = i
		# find minimum in sublist x[i:]
		for j in range(i, len(x)):
			if x[j] < x[imin]:
				imin = j
		swap(x, i, imin)

A = [5, 2, 4, 6, 1, 3]

ssort(A)

A

# Insertion sort

def isort(x):
	"""
	Sorts a list of numbers in-place using insertion sort
	param x: The list to sort (in place)
	returns: None
	"""
	for i in range(len(x)):
		j = i - 1
		# swap x[i] toward front of sorted sublist x[:i]
		while j >= 0 and x[i] < x[j]:
			if x[i] < x[j]:
				swap(x, i, j)
				i = j # note: won't affect next iteration's 'i'!
			j -= 1

A = [5, 2, 4, 6, 1, 3]

isort(A)

A

# Merge sort

def merge(a, b):
	"""
	Merges two sorted lists into a single sorted list
	param a: First sorted list
	param b: Second sorted list
	returns: A (new) sorted list
	"""
	i, j, k = 0, 0, 0
	# initialize output list
	out = [0] * (len(a) + len(b))
	# iterate through inputs
	while i < len(a) or j < len(b):
		# check both 'a' and 'b' have more elements
		if i < len(a) and j < len(b):
			# check whether to get a[i] or b[j]
			if a[i] <= b[j]:
				out[k] = a[i]
				i += 1
			else:
				out[k] = b[j]
				j += 1
		# if 'a' is exhausted, get b[j]
		elif i >= len(a):
			out[k] = b[j]
			j += 1
		# if 'b' is exhausted, get a[i]
		elif j >= len(b):
			out[k] = a[i]
			i += 1
		# don't forget to iterate!
		k += 1
	return out

A = [2, 4, 5, 7]
B = [1, 2, 3, 6]

merge(A, B)

def msorted(x):
	"""
	Returns a sorted list of numbers using merge sort
	param x: The list to sort
	returns: A sorted copy of the list
	"""
	if len(x) <= 1:
		return x
	else:
		i = len(x) // 2
		a = msorted(x[:i])
		b = msorted(x[i:])
		return merge(a, b)

A = [5, 2, 4, 7, 1, 3, 2, 6]

msorted(A)


