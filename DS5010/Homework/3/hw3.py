
class Node:
	"""
	A class for a node in a doubly-linked list, storing
	a data payload and links to next and previous nodes.
	"""

	def __init__(self, data = None, prev = None, next = None):
		"""Initialize the node with data payload and link to next node."""
		self.data = data
		self.next = next
		self.prev = prev

	def getdata(self):
		"""Get the node's data payload."""
		return self.data

	def setdata(self, data = None):
		"""Set the node's data payload."""
		self.data = data

	def getnext(self):
		"""Get the next linked node."""
		return self.next

	def setnext(self, node = None):
		"""Set the next linked node."""
		self.next = node

	def getprev(self):
		"""Get the previous linked node."""
		return self.prev

	def setprev(self, node = None):
		"""Set the previous linked node."""
		self.prev = node

class Deque:
	"""
	A double-ended queue supporting accessing
	the items at either end of the container.
	"""

	def __init__(self):
		"""Initializes an empty deque storing both head and tail nodes."""
		self.head = None
		self.tail = None

	def __iter__(self):
		"""Returns a forward iterator over the deque."""
		node = self.head
		while node is not None:
			yield node.getdata()
			node = node.getnext()

	def __reversed__(self):
		"""Returns a reverse iterator over the deque."""
		node = self.tail
		while node is not None:
			yield node.getdata()
			node = node.getprev()

	def __str__(self):
		"""Returns a string representation of the deque."""
		return " -> ".join([str(x) for x in self])

	def __repr__(self):
		"""Returns a printable representation of the deque."""
		return str(self)

	def __len__(self):
		"""Returns the length of the deque."""
		size = 0
		for i in self:
			size += 1
		return size

	### Problem 1

	def push(self, data):
		"""
		Adds a new item to the front of the deque.
		param data: The new item to prepend to the deque.
		returns: None
		"""
		node = Node(data)
		if self.head is None:
			self.head = node
			self.tail = node
		else:
			node.setnext(self.head)
			self.head.setprev(node)
			self.head = node

	### Problem 2

	def pop(self):
		"""
		Removes and returns the front item of the deque.
		returns: The item removed from the front deque, or None if empty.
		"""
		if self.head is None:
			return None
		else:
			data = self.head.getdata()
			self.head = self.head.getnext()
			if self.head is None:
				self.tail = None
			else:
				self.head.setprev(None)
			return data

	def peek(self):
		"""
		Returns the front item of the deque (without removing it).
		returns: The item at the front of the deque, or None if empty.
		"""
		return self.head.getdata()

	### Problem 3

	def push_back(self, data):
		"""
		Adds a new item to the back of the deque.
		param data: The new item to append to the deque.
		returns: None
		"""
		node = Node(data)
		if self.tail is None:
			self.tail = node
			self.head = node
		else:
			node.setprev(self.tail)
			self.tail.setnext(node)
			self.tail = node

	### Problem 4

	def pop_back(self):
		"""
		Removes and returns the item at the back of the deque.
		returns: The item removed from the back of the deque, or None if empty.
		"""
		if self.tail is None:
			return None
		else:
			data = self.tail.getdata()
			self.tail = self.tail.getprev()
			if self.tail is None:
				self.head = None
			else:
				self.tail.setnext(None)
			return data

	def peek_back(self):
		"""
		Returns the item at the back of the deque (without removing it).
		returns: The item at the back of the deque, or None if empty.
		"""
		return self.tail.getdata()

	### Problem 5

	def find(self, value):
		"""
		Finds the index of the given value in the deque.
		param value: The value to search for in the deque.
		returns: The index of the value if it exists; otherwise, None.
		"""
		for i, val in enumerate(self):
			if val == value:
				return i
		return None


if __name__ == "__main__":
	x = Deque()
	x.push("1!")
	x.push("2!")
	x.push("3!")
	print(x)		# 3! -> 2! -> 1!
	x.pop()			# 3!
	print(x)		# 2! -> 1!
	x.push_back("go!")
	print(x)		# 2! -> 1! -> go!
	x.pop_back()	# go!
	x.pop()			# 2!
	x.pop()			# 1!
	x.pop()			# None
	print(x)
	y = Deque()
	y.push_back(1.11)
	y.push_back(2.22)
	y.push_back(3.33)
	print(y)		# 1.11 -> 2.22 -> 3.33
	y.find(1.11)	# 0
	y.find(2.22)	# 1
	y.find("a")		# None



