# microprocessor8086-project
## Binary Search

 In this program, the user creates an array and can search for an element in it. The user first starts by entering the size of the array n, and 0<n<128. 
 
After that the user writes each element of the array in a loop, 0<arr[i]<128. 

After filling the array, the user is supposed to enter the key to search for, which also has to be in the range 0<s<128.

If the user tries to enter a non-number character, or a number outside the specified range, in either the array size, entry or the search key, the program will terminate with an error message. 

For the searching technique to work, the array needs to be sorted, with the order of elements going from smallest to largest. So for example if the user enters '5' in the first element, the following element has to be greater than or equal to 5, and if he tried to enter something like '2' or '3', the program gives an error message, then restarts the current step in the loop.

After the array is completely filled and the search key entered, the progran will search through the array using the binary search technique. Which compares the element you are searching for with the middle element of your array, if it's larger then it searches in the right half of the array (the larger numbers), and if lower does so in the left half (the smaller numbers), then the same code is run until either it finds the element, in which case it returns the value of its index, and prints that the key was found and the its index. Or it reaches a point in which the array can no longer be divided, so the program prints that the key wasn't found.
