# DS5010 Homework 1 by Abhilasha Jain
# Five functions
# 1. mean()
# 2. imax()
# 3. mode()
# 4. tokenize()
# 5. count_words()



# PROBLEM NUMBER 1
# returns the mean of list x

def mean(x):

   result = 0   # result holds the result & set it to 0
   
   count = 0    # count holds the number of valid elements of x & set it to 0
   
   for element in x:  # iterate each element of x using element as element

       if isinstance(element, int) or isinstance(element, float):  # if element is int or float
   
           result = result + element    # add result to element and update result
   
           count = count + 1    # increment count by 1

   if count == 0:      # if count is 0
   
       return None     #   return none
   
   else:               # otherwise count is greater than 0
   
       return result / count   #   return result divided by count



# PROBLEM NUMBER 2
# returns the index of the maximum element of list x

def imax(x): 

   result = 0           #result stores the result set to 0 initially

   count = 0            #count stores the no. of valid elements in x

   maximum = 0          #maximum stores the maximum value of x

   for index in range(len(x)): #iterate each element of x using index as index

       if isinstance(x[index], int) or isinstance(x[index], float):     # if element is int or float
           
           #   we have our first int or float
           if count == 0:       # if count is 0
       
               maximum = x[index]   # set maximum to x of index
               
               result = index       # set result to index
           
           elif x[index] > maximum:

               maximum = x[index]
            
               result = index
           
           count = count + 1        # increment count by 1

   if count == 0:       #  if count is 0, return none
   
       return None
   
   else:                # otherwise count is greater than 0
   
       return result    #   return result



# PROBLEM NUMBER 3
# returns the mode of list x
# it ALWAYS return a list in order to accommodate multiple modes
def mode(x):

   # dictionary holds the frequency table of x
   # where element of x is the key and the frequency its value
   
   dictionary = {}    
   
   for element in x:    # iterate each element of x
          
       if element in dictionary:     # if element is already in the dictionary increment it's value by 1
   
           dictionary[element] = dictionary[element] + 1     # add a key value pair with element as key and 1 as value
   
       else:                         # otherwise element does not exist in the dictionary
   
           dictionary[element] = 1

   result = []     # result holds the list of mode/modes and set result as an empty list
   
   result = max(dictionary, key= dictionary.get) #get key with max value.
   
   return result  # return result

 

# PROBLEM NUMBER 4
# returns a list of tokenized words separated by whitespaces with each
# word suitable for caseless comparisons
# (I converted them to lower case) and comprised only of alphanumeric characters

def tokenize(s):
    
    result = []          # result holds the result & set it as an empty list
    
    words = s.split()    # call split of s and save list to words
    
    for word in words:   # iterate each word in words using word as the element
    
        word = word.lower()      # convert word to lowercase so that we can do caseless comparisons
    
        # string is a word with having only alphanumeric character
        string = ""              # set string as an empty string
        
        for character in word:   # iterate each character of the word
    
            # if character is either a letter or a number
            if (character >= 'a' and character <= 'z') or (character >= '0' and character <= '9'):
    
                string = string + character    # add character to string
        
        # if string is not empty add string to result
        if len(string) > 0:
    
           result.append(string)
   
    return result     # return result

 

# PROBLEM NUMBER 5
# returns a dictionary with alphanumeric only
# keys containing unique words of s and values it's corresponding frequencies

def count_words(s):

   result = {}      # result holds the result & set it as an empty dictionary
   
   a_list = tokenize(s)     # call tokenize with s as parameter and save result to a_list
   
   for element in a_list:   # iterate each element of a_list using element as element
     
       if element in result:   # if element is already in result
   
           result[element] = result[element] + 1   # increment it's value by 1
   
       else:         # otherwise element does not exist in result
   
           result[element] = 1    # add a key value pair with element as key and 1 as value

   return result        # return result