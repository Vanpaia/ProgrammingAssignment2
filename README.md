# ProgrammingAssignment2

## DESCRIPTION

This is a pair of functions, the first creates a list of different functions for use by the second function, which computates the inverse of a given matrix or, if the inverse of that given matrix has already been computed, simply returns the cached inverse

## HOW THESE FUNCTIONS NEED TO BE USED:

If you have a matrix called x, you first need to used the makeCacheMatrix function to create a new object, ex.:
`a <- makeCacheMatrix(x)`

this new object called a can now be used to solve (invert) the matrix, ex.:
`cacheSolve(a)`

The first time it will computate the result, try it at least twice to see the  cached version.

To change the matrix being inverted you don't need to make a new object (list), you
can change the matrix in the list (a) to a new matrix (z) by using `a$set(z)`.