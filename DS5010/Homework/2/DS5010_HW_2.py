# DS5010 Homework 2 by Abhilasha Jain
# Five functions
# 1. median()
# 2. iqr()
# 3. fivenum()
# 4. order()
# 5. rank()



# PROBLEM NUMBER 1
# returns the median of list x

def median(x):

    n = len(x)                      # store length of list x in n

    x = sorted(x)                   # sort the list in ascending order

    return (x[n//2-1]/2.0 + x[n//2]/2.0, x[n//2])[n % 2] if n else None         # return mean of two middle numbers if n is even as result or the middle number of the sorted list as median


# PROBLEM NUMBER 2
# return the interquartile range (iqr) of list x

def iqr(x):
    
    if len(x) <= 1:      # if length of x less than equal 1, then return iqr as 0
        return 0

    sort_x = sorted(x)   # otherwise, sorting x in increasing order

    N = len(x)           # length of x

    # Calculating Q1 and Q3 for x   
    if N % 2 == 0:       # if length of x is even
        
        Q1 = median(sort_x[:N // 2]) # Q1 is median of first n = N/2 numbers

        Q3 = median(sort_x[N // 2:]) # Q3 is median of N/2:end numbers

    
    else:                # else if length is odd
        
        Q1 = median(sort_x[:N // 2 + 1])  # Q1 is median of first N/2 + 1 numbers
        
        Q3 = median(sort_x[N // 2:])      # Q3 is median of N//2 + 1:end numbers

    
    cal_iqr = Q3 - Q1        # calculating iqr = Q3 - Q1

    
    return cal_iqr   # returning iqr


# PROBLEM NUMBER 3
# returns the five summary statistics: the minimum, Q1, the median, Q3, and the maximum of the dataset

def fivenum(x):
    
    x.sort()   #sort the list into increasing order
    
    minimum, maximum = x[0], x[-1]    #assign first and last element of sorted list as minimum and maximum
    
    median = x[len(x) // 2] if len(x) % 2 == 1 else (x[len(x) // 2] + x[len(x) // 2 - 1]) / 2 #median of list x
    
    q1 = x[:len(x) // 2]        #store the first half of list x in q1
    
    q3 = x[(len(x) // 2):] if len(x) % 2 == 0 else x[len(x) // 2 + 1:]  #store the second half of list x in q3
    
    q1_ = q1[len(q1) // 2] if len(q1) % 2 == 1 else (q1[len(q1) // 2] + q1[len(q1) // 2 - 1]) / 2  #median of list q1
    
    q3_ = q3[len(q3) // 2] if len(q3) % 2 == 1 else (q3[len(q3) // 2] + q3[len(q3) // 2 - 1]) / 2  #median of list q3
    
    return [minimum, q1_, median, q3_, maximum]   #returns five summary statistics


# PROBLEM NUMBER 4
# returns the indices of elements of list x as sorted in order from least to greatest

def order(x):

    result = []                        # result list to store the indices

    Li = list(x)                        # making a copy of x (x will remain unchanged)

    Li.sort()                           # sorting list Li

    for i in range(len(Li)):            # loop through every element in Li

        for j in range(len(x)):        # loop through every element in x

            if Li[i] == x[j]:           # check if Li[i] is equal to x[i]

                if j not in result:    # check if index j is not in result
    
                    result.append(j)   # add the index j to result

    return result     # return the result list

# PROBLEM NUMBER 5
# returns a list of ranks of the corresponding elements of x

def rank(x):

    R = [0 for A in range(len(x))] # Rank Vector

    for i in range(len(x)):  # Sweep through all element in A
        
        (r, s) = (1, 1)
        
        for j in range(len(x)):    #for each element in list
            
            if j != i and x[j] < x[i]:  #count the number of less than elements in r
                
                r += 1
            
            if j != i and x[j] == x[i]:  #count the number of equal elements in s
                
                s += 1
    
        R[i] = r + (s - 1) # Using formula to obtain rank

    return R    # Return Rank Vector


