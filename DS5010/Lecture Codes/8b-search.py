
def lsearch(x, value):
    """
    Linear search of list x for value
    param x: The list to search
    param value: The value to find
    returns: The index of value in x, or None if not found
    """
    for i, xi in enumerate(x):
        if value == xi:
            return i
    return None

def bsearch(x, value):
    """
    Binary search of a _sorted_ list x for value
    param x: The list to search, which _MUST_ be sorted
    param value: The value to find
    returns: The index of value in x, or None if not found
    """
    lo, hi = 0, len(x)
    while lo <= hi and len(x) > 0:
        i = (lo + hi) // 2
        if value < x[i]:
            hi = i - 1
        elif value > x[i]:
            lo = i + 1
        else:
            return i
    else:
        return None

