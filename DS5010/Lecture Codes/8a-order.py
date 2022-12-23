
import random

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

def ssorted(x):
    """
    Returns a sorted list of numbers using selection sort
    param x: The list to sort
    returns: A sorted copy of the list
    """
    xcopy = list(x)
    ssort(xcopy)
    return xcopy

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

def isorted(x):
    """
    Returns a sorted list of numbers using insertion sort
    param x: The list to sort
    returns: A sorted copy of the list
    """
    xcopy = list(x)
    isort(xcopy)
    return xcopy

def merge(a, b):
    """
    Merges two sorted lists into a single sorted list
    param a: First sorted list
    param b: Second sorted list
    returns: A (new) sorted list
    """
    i, j, k = 0, 0, 0
    # initialize output list
    out = [None] * (len(a) + len(b))
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

def randlist(n):
    """
    Returns a list _n_ of random numbers in the interval [0,1).
    param n: The length of the list
    returns: A list of random numbers
    """
    return [random.random() for i in range(n)]

