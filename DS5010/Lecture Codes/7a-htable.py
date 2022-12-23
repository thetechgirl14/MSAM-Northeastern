
### A simple hash table / hash map class

class HTable:

    def __init__(self, buckets=1000):
        self.numbuckets = buckets
        self.size = 0
        self.keys = [[] for i in range(buckets)]
        self.values = [[] for i in range(buckets)]

    def __len__(self):
        return self.size

    def __str__(self):
        return ", ".join([str(k) + " -> " + str(v) for k, v in self.items()])

    def __repr__(self):
        return str(self)

    def hashkey(self, key):
        return hash(key) % self.numbuckets

    def loadfactor(self):
        return self.size / self.numbuckets

    def set(self, key, value):
        bucket = self.hashkey(key)
        if key in self.keys[bucket]:
            i = self.keys[bucket].index(key)
            self.values[bucket][i] = value
        else:
            self.keys[bucket].append(key)
            self.values[bucket].append(value)
            self.size += 1

    def get(self, key, default = None):
        bucket = self.hashkey(key)
        if key in self.keys[bucket]:
            i = self.keys[bucket].index(key)
            return self.values[bucket][i]
        else:
            return default
    
    def delete(self, key):
        bucket = self.hashkey(key)
        if key in self.keys[bucket]:
            i = self.keys[bucket].index(key)
            del self.keys[bucket][i]
            del self.values[bucket][i]
            self.size -= 1

    def __setitem__(self, key, value):
        self.set(key, value)

    def __getitem__(self, key):
        return self.get(key)

    def __delitem__(self, key):
        self.delete(key)

    def keys(self):
        for bucket in range(self.numbuckets):
            for key in self.keys[bucket]:
                yield key

    def values(self):
        for bucket in range(self.numbuckets):
            for key in self.values[bucket]:
                yield values

    def items(self):
        for bucket in range(self.numbuckets):
            for key, val in zip(self.keys[bucket], self.values[bucket]):
                yield (key, val)

### Test HTable methods

if __name__ == "__main__":
    x = HTable()
    x["a"] = 1.11
    x["b"] = 2.22
    x["c"] = 3.33
    x["a"]
    print(x)
    print(len(x))
    print(x.loadfactor())
    del x["a"]
    print(x)
    print(len(x))


