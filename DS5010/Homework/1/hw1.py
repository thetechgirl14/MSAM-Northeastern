
import math

# Problem 1

def mean(x):
	"""
	Calculates the mean of a all numeric values in an iterable.
	param x: The iterable for which to calculate the mean.
	returns: Mean of all numeric values, or None if no numeric values.
	"""
	xsum = 0
	count = 0
	for xi in x:
		if isinstance(xi, (int, float)):
			xsum += xi
			count += 1
	if count > 0:
		return xsum / count
	else:
		return None

# Problem 2

def imax(x):
	"""
	Calculates the index of the maximum numeric value in an iterable.
	param x: The iterable for which to find the maximum numeric value.
	returns: Index of the maximum numeric value, or None if no numeric values.
	"""
	xmax = -math.inf
	cur_index = 0
	max_index = 0
	for xi in x:
		if isinstance(xi, (int, float)) and xi > xmax:
			max_index = cur_index
			xmax = xi
		cur_index += 1
	if xmax > -math.inf:
		return max_index
	else:
		return None

# Problem 3

def count(x):
	"""
	Counts the instances of unique values in an iterable.
	param x: The iterable for which to count the values.
	returns: A dictionary with the unique values and their counts.
	"""
	counts = {}
	for xi in x:
		if xi in counts:
			counts[xi] += 1
		else:
			counts[xi] = 1
	return counts

def mode(x):
	"""
	Calculates the most common value (mode) of an iterable.
	param x: The iterable for which to calculate the mode.
	returns: A most common value.
	"""
	counts = count(x)
	keys, values = zip(*counts.items())
	index_max = imax(values)
	return keys[index_max]

# Problem 4

def to_alnum(s):
	"""
	Strips a string of non-alphanumeric characters, including whitespace.
	param s: A string to strip of all non-alphanumeric characters.
	returns: The string with non-alphanumeric characters removed.
	"""
	return "".join(ch for ch in s if ch.isalnum())

def tokenize(s):
	"""
	Tokenizes a string into alphanumeric words of the same case.
	param s: A string to tokenize.
	returns: List of words with only alphanumeric characters.
	"""
	return [to_alnum(token.casefold()) for token in s.split()]

# Problem 5

def count_words(s):
	"""
	Count the occurences of words in a string, not including punctuation.
	param s: The string for which to count the words.
	returns: A dictionary with words and their counts.
	"""
	return count(tokenize(s))

if __name__ == "__main__":
	mean([1, 2, 3, 4, 5, 6])				# 3.5
	mean([1.11, 2.22, 3.33, "abc"])			# 2.22
	mean(["hello!", "world!", "test!"])		# None
	imax([1, 2, 3, 100, 3, 2])				# 3
	imax([-999, -99, -9, -99, "abc"])		# 2
	imax(["hello!", "world!", "test!"])		# None
	mode([1, 1, 2, 3, 5, 8, 13])			# 1
	mode([-999, -99, -9, -99, "abc"])		# -99
	mode(["a", "a", "b", "b", "b", "c"])	# 'b'
	tokenize("Hello, world!")				# ['hello', 'world']
	tokenize("Hi! Hi! Who are you?")		# ['hi', 'hi', 'who', 'are', 'you']
	count_words("I am that I am.")			# {'i': 2, 'am': 2, 'that': 1}
	count_words("We are not who we are.")	# {'we': 2, 'are': 2, 'not': 1, 'who': 1}






