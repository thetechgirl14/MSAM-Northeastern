
import math

# Problem 1

def median(x):
	"""
	Calculates the median value of a numeric list.
	param x: A list of numbers
	returns: The median of x
	"""
	if len(x) < 1:
		return None
	xs = sorted(x)
	n = len(xs)
	i1 = math.floor((n + 1) / 2) - 1
	i2 = math.ceil((n + 1) / 2) - 1
	return (xs[i1] + xs[i2]) / 2

# Problem 2

def split(x):
	"""
	Spilts a list x into upper and lower halves, including
	the middle element in _both_ halves if len(x) is odd.
	param x: A list to split
	returns: A list with the lower half and upper half of x
	"""
	n = len(x)
	i1 = math.ceil(n / 2)
	i2 = math.floor(n / 2)
	return [x[:i1], x[i2:]]

def iqr(x):
	"""
	Calculates the interquartile range (IQR) of a numeric list.
	param x: A list of numbers
	returns: The IQR, which is 0 if len(x) <= 1.
	"""
	x1, x2 = split(x)
	if len(x) > 1:
		return median(x2) - median(x1)
	else:
		return 0

# Problem 3

def fivenum(x):
	"""
	Returns Tukey's five number summary, which is the sample
	minimum, lower-hinge, median, upper-hinge, and maximum.
	param x: A list of numbers
	returns: A list of five numbers giving the summary
	"""
	if len(x) < 1:
		return None
	x1, x2 = split(x)
	q1 = median(x1)
	med = median(x)
	q3 = median(x2)
	return [min(x), q1, med, q3, max(x)]

# Problem 4

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

def order(x):
	"""
	Returns a list giving the indices of x if its elements
	were sorted from least to greatest.
	param x: A list of comparables
	returns: A sorted list of indices
	"""
	xc = x[:] # copy x to avoid side-effects
	y = list(range(len(xc))) # create index list
	for i in range(len(xc)):
		j = i - 1
		# swap x[i] toward front of sorted sublist x[:i]
		while j >= 0 and xc[i] < xc[j]:
			if xc[i] < xc[j]:
				swap(xc, i, j) # sort x
				swap(y, i, j) # sort indices
				i = j # note: won't affect next iteration's 'i'!
			j -= 1
	return y

# Problem 5

def rank(x):
	"""
	Returns a list giving the rankings of the corresponding
	elements of x from least to greatest.
	param x: A list of comparables
	returns: A list of ranks
	"""
	r = [0] * len(x)
	for r0, i in enumerate(order(x)):
		r[i] = r0 + 1
	return r



