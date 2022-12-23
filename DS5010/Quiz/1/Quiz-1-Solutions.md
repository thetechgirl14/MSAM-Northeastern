---
title: "DS 5010 Example Quiz 1 - Solutions"
output: pdf_document
geometry: margin=1in,top=0.5in
---

# Instructions

Answer each problem to the best of your ability. Fully read instructions for all problems. Justify or explain your answers when appropriate. Partial credit will be given for answers that are partially correct. Points will be deducted for incorrect statements even if all other parts of your answer are correct.

You may use notes and references from this class while taking the quiz.  You may use a Python 3 interpreter. You may __NOT__ use external websites or other online resources.

You may __NOT__ collaborate with other students while taking the quiz, or communicate any information about the quiz that may give any student an unfair advantage.

All questions are written assuming Python unless otherwise specified. Code you write may use built-in functions, but may __NOT__ rely on any imported modules.

By submitting your answers, you agree to the following:

*I promise I will not cheat on this quiz. I will neither give nor receive any unauthorized assistance. I will not share information about the quiz with anyone who may be taking it at a different time. I have not been told anything about the quiz by someone who has taken it earlier.*

----

# Quiz

----

## Multiple choice

For each problem, choose the **best** answer for each question.

#### What is the time complexity of the following function?

```
def foo(x):
    if len(x) > 1:
        i = len(x) // 2
        return foo(x[i:]) + foo(x[:i])
    else:
        return x
```

- a. O(1)
- b. O(n)
- c. O(n^2)
- d. O(n^3)
- __e. O(n log n)__

#### What is the time complexity of the following function?

```
def foo(x):
    a = len(x)
    for i in range(100):
        a = a + i
    return a
```

- __a. O(1)__
- b. O(n)
- c. O(n^2)
- d. O(log n)
- e. O(n!)

#### What is the time complexity of the following function?

```
def foo(x):
    a = []
    i = 0
    while i < len(x):
        j = 0
        while j < len(x):
            a.append(x[j])
            j += 1
        i += 1
    return a
```

- a. O(n)
- __b. O(n^2)__
- c. O(n^3)
- d. O(log n)
- e. O(n log n)

#### What value does `foo([1.0, 2.0, 3.0])` return?

```
def foo(x):
    a = 0
    for i in range(x):
        a += x[i]
    print(a)
```

- a. [1, 2, 3]
- b. 6
- c. 6.0
- d. "6"
- __e. None__

#### How do you access the *i*th element of a list or tuple (where *i*th means 1st, 2nd, 3rd, etc.)?

- a. x[i]
- b. x[i + 1]
- __c. x[i - 1]__
- d. x[i + i * len(x)]
- e. x[i - i * len(x)]

#### Which of the following can NOT be used as a key in a `dict`?

- a. "foo"
- b. 1
- c. 1.0
- d. (1,)
- __e. {"foo"}__

#### When searching for a value in a sorted list, how would a "divide and conquer" algorithm work?

- a. Start at the beginning of the list and iterate through it until the value is found
- b. Start at the middle of the list and iterate in both directions at once
- c. Split the list in half and iterate through one of them after checking the bounds of each sub-list
- __d. Split the list recursively until encountering a sub-list containing one element which is the value__
- e. None of these

#### What value does `foo(3)` return?

```
def foo(x = 1, a = []):
    a.append(x)
    return a
```

- a. []
- b. [1]
- c. [3]
- d. [1, 3]
- __e. Cannot be determined from given information__

#### Which will be the faster algorithm for sorting lists *as the size of the list grows large*?

- a. Selection sort
- b. Insertion sort
- __c. Merge sort__
- d. Random sort (try random permutations until it is sorted)
- e. Cannot be determined from given information

#### Which will be the faster algorithm for sorting a list *that is already sorted*?

- a. Selection sort
- __b. Insertion sort__
- c. Merge sort
- d. Random sort (try random permutations until it is sorted)
- e. Cannot be determined from given information

#### A function defined as part of a class definition is called what?

- a. magic
- b. class function
- c. hook
- d. callable
- __e. method__

#### A concrete object of a class is called what?

- __a. instance__
- b. function
- c. attribute
- d. method
- e. variable

----

## Multiple-multiple choice

For each problem, choose **all** correct answers and/or statements.

#### What are properties of Python as a programming language? (choose all that apply)

- a. Source code must be compiled to machine code
- b. Variable types must be declared (static typing)
- __c. Memory is managed and garbage collected by the interpreter__
- __d. Byte code is run by a virtual machine__
- __e. Code blocks are defined by indentation__

#### What are characteristics of `list` objects? (choose all that apply)

- __a. Mutable__
- __b. Ordered collection__
- __c. Duplicate items allowed__
- d. Items must be the same data type
- __e. Access items by offset__

#### What are characteristics of `tuple` objects? (choose all that apply)

- a. Mutable
- __b. Ordered collection__
- __c. Duplicate items allowed__
- d. Items must be the same data type
- __e. Access items by offset__

#### What are characteristics of `dict` objects? (choose all that apply)

- __a. Mutable__
- b. Ordered collection
- __c. Duplicate items (values) allowed__
- d. Items must be the same data type
- e. Access items by offset

#### What are characteristics of `set` objects? (choose all that apply)

- __a. Mutable__
- b. Ordered collection
- c. Duplicate items allowed
- d. Items must be the same data type
- e. Access items by offset

#### Which of the following are properties of merge sort? (choose all that apply)

- __a. For a given list size, it will perform the same number of operations regardless of original list order__
- __b. It must create a larger amount of intermediate result objects than insertion sort or selection sort__
- c. The number of times it splits the list grows linearly with the size of the original list
- __d. The number of items it compares with each set of merges grows linearly with the size of the original list__
- e. It always mutates the list in place

#### The merge sort function below is an example of what programming techniques? (choose all that apply)

```
def merge_sorted(x):
    if len(x) <= 1:
        return x
    else:
        i = len(x) // 2
        a = merge_sorted(x[:i])
        b = merge_sorted(x[i:])
        return merge(a, b)
```

- __a. Divide and conquer__
- b. Object-oriented programming
- c. Memoization
- d. Iteration
- __e. Recursion__

#### The Fibonacci function below is an example of what programming techniques? (choose all that apply)

```
def fibonacci(n, a={}):
    if n == 1 or n == 2:
        return 1
    elif n not in a:
        a[n] = n + fibonacci(n-1)
    return a[n]
```

- a. Divide and conquer
- b. Object-oriented programming
- __c. Memoization__
- d. Iteration
- __e. Recursion__

#### The factorial function below is an example of what programming techniques? (choose all that apply)

```
def factorial(x):
    if x == 0:
        return 1
    else:
        y = 1
        for i in range(x):
            y = y * (x - i)
        return y
```

- a. Divide and conquer
- b. Object-oriented programming
- c. Memoization
- __d. Iteration__
- e. Recursion

#### What are the local variables in the following code? (choose all that apply)

```
z = 5

def prod(x):
    p = 1
    for i in range(x):
        p = p * x[i]
    return p

y = prod(z)
```

- a. z
- __b. x__
- __c. p__
- __d. i__
- e. y

#### Object-oriented programming (OOP) concepts include (choose all that apply):

- __a. class__
- __b. instance__
- __c. method__
- d. functional
- e. closure

#### Features of object-oriented programming (OOP) include (choose all that apply):

- __a. encapsulation__
- __b. composition__
- __c. inheritance__
- __d. polymorphism__
- e. currying

----

## Short answer

Fully answer each question to the best of your ability.

#### Describe in your own words what the following function does, including its purpose, how it accomplishes its purpose, and the value it returns.

```
def foo(n):
    if n <= 1:
        return False
    elif n == 2:
        return True
    for i in range(2, n):
        if n % i == 0:
            return False
    return True
```

Returns True if `n` is a prime number, and False otherwise.

----

## Coding

#### Write a function in Python that satisfies the following specification. (Use "Preformatted" text style.)

```
def which(x, value):
    """
    Searches for all occurences of a value in an iterable.
    param x: An iterable to search for occurences of value.
    param value: The value to find in x.
    returns: A list containing ALL indices (offsets) where the specified
    value occurs in the list, or an empty list if value is not found.
    """
    out = []
    for i, xi in enumerate(x):
        if xi == value:
            out.append(i)
    return out
```


