
### A simple class to "cons"-truct a
### a memory object holding two values/pointers

class CONS:

	def __init__(self, first=None, rest=None):
		self.first = first
		self.rest = rest

	def __str__(self):
		return str((self.first, self.rest))

	def getfirst(self):
		return self.first

	def getrest(self):
		return self.rest

	def setfirst(self, first=None):
		self.first = first

	def setrest(self, rest=None):
		self.rest = rest

### A simple linked list implementation

class LList:

	def __init__(self):
		self.head = None

	def __iter__(self):
		cell = self.head
		while cell is not None:
			yield cell.getfirst()
			cell = cell.getrest()

	def __str__(self):
		return " -> ".join([str(x) for x in self])

	def __repr__(self):
		return str(self)

	def __len__(self):
		size = 0
		for i in self:
			size += 1
		return size

	def append(self, value):
		newcell = CONS(value, None)
		if self.head is None:
			self.head = newcell
		else:
			tail = self.head
			while tail.getrest() is not None:
				tail = tail.getrest()
			tail.setrest(newcell)

	def get(self, index):
		cell = self.head
		current = 0
		while cell is not None:
			if current == index:
				return cell.getfirst()
			cell = cell.getrest()
			current += 1
		raise IndexError

	def __getitem__(self, index):
		return self.get(index)

	def insert(self, index, value):
		cell = self.head
		current = 0
		if index == 0:
			if cell is not None:
				self.head = CONS(value, cell)
			else:
				raise IndexError
		else:
			while cell is not None:
				if current == index:
					break
				prev = cell
				cell = cell.getrest()
				current += 1
			if cell is not None:
				prev.setrest(CONS(value, cell))
			else:
				if current == index - 1:
					prev.setrest(CONS(value, None))
				else:
					raise IndexError

	def delete(self, index):
		cell = self.head
		current = 0
		if index == 0:
			if cell is not None:
				self.head = cell.getrest()
			else:
				raise IndexError
		else:
			while cell is not None:
				if current == index:
					break
				prev = cell
				cell = cell.getrest()
				current += 1
			if cell is not None:
				prev.setrest(cell.getrest())
			else:
				raise IndexError

	def __delitem__(self, index):
		self.delete(index)

	def mapfun(self, fun, **kwargs):
		cell = self.head
		while cell is not None:
			value = cell.getfirst()
			cell.setfirst(fun(value, **kwargs))
			cell = cell.getrest()

### Test LList methods

if __name__ == "__main__":
	x = CONS(3.14, None)
	print(x)
	l = LList()
	l.append(1.11)
	l.append(2.22)
	l.append(3.33)
	print(l[0])
	print(l[1])
	print(l[2])
	print(l)
	print(len(l))
	del l[1]
	print(l)
	l.insert(1, 2.22)
	l.insert(4, 4.44)
	l.insert(0, 1.01)
	print(l)
	print(len(l))
	l.mapfun(lambda x: 2 * x)
	print(l)
	l.mapfun(lambda x, y: x + y, y = 100)
	print(l)

