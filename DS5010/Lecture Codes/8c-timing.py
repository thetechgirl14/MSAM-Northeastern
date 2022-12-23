
import sys
import timeit
import statistics
import random

import order
import search

if len(sys.argv) > 1:
    n = int(sys.argv[1])
else:
    n = 1000

if len(sys.argv) > 2:
    reps = int(sys.argv[2])
else:
    reps = 10

def bench(expr = "pass", reps = 100, echo = False):
    elapsed = timeit.timeit(expr, globals=globals(), number=reps)
    time = elapsed / reps
    if echo:
        t = format(time, ".9f")
        s = expr + ": " + t + "s (avg of " + str(reps) + " reps)"
        print(s)
    return time

echo = True

random.seed(2021)

u = sorted(order.randlist(100 * n))
i = random.randint(0, 100 * n)

x = order.randlist(n)
y = sorted(x)
z = sorted(x, reverse=True)

bench('search.lsearch(u, u[i])', reps, echo)
bench('search.bsearch(u, u[i])', reps, echo)

bench('order.ssorted(x)', reps, echo)
bench('order.isorted(x)', reps, echo)
bench('order.msorted(x)', reps, echo)

bench('order.ssorted(y)', reps, echo)
bench('order.isorted(y)', reps, echo)
bench('order.msorted(y)', reps, echo)

bench('order.ssorted(z)', reps, echo)
bench('order.isorted(z)', reps, echo)
bench('order.msorted(z)', reps, echo)

