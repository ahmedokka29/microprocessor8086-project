# microprocessor8086-project

## Binary Search

In this program, the user creates an array and can search for an element in it.

The user first starts by entering the size of the array n, and `0<n<127`. 
 
After that the user writes each element of the array in a loop, `0<=arr[i]<127`. 

After filling the array, the user is supposed to enter the key to search for, which also has to be in the range `0<s<127`.

If the user tries to enter a non-number character, in either the array size, entry or the search key, the program will give an invalid charachter message ans ask the user to 
re-enter the number. 

If the user enter a number outside the specified range the program terminates with an OVERFLOW message

For the searching technique to work, the array needs to be sorted, with the order of elements going from smallest to largest. So for example if the user enters '5' in the first element, the following element has to be greater than or equal to 5, and if he tried to enter something like '2' or '3', the program gives an error message, then restarts the current step in the loop.

After the array is completely filled and the search key entered, the program will search through the array using the binary search technique. Which compares the element you are searching for with the middle element of your array, if it's larger then it searches in the right half of the array (the larger numbers), and if lower does so in the left half (the smaller numbers), then the same code is run until either it finds the element, in which case it returns the value of its index, and prints that the key was found and the its index. Or it reaches a point in which the array can no longer be divided, so the program prints that the key wasn't found.

## Illustrative video on How the program work

https://user-images.githubusercontent.com/56696104/148626840-12b18a4a-8ed9-47f5-a4fb-44f330557eec.mp4

<br/>
Better Technique 

https://user-images.githubusercontent.com/56696104/148627268-58a5e86e-9913-41c5-b062-49725f867431.mp4


## Support 
Thanks to :

1. Prof. Abdelhamid Attaby
2. Eng. Ahmed Bakr

for helping to understand assamply language , and implement Binary Search using it.

## Our Team :

- [Sayed Hassan](https://github.com/9mm-bot)
- [Ziad Mohamed](https://github.com/ZiadSENG)
- [Ibrahim Mohamed](https://github.com/hemagazzar)
- [Ahmed Okka](https://github.com/ahmedokka29)
- [Ahmed Tarek](https://github.com/ahmedashour28)  
