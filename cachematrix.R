## This is a pair of functions, the first creates a list of different functions for 
## use by the second function, which computates the inverse of a given matrix or, if
## the inverse of that given matrix has already been computed, simply returns the
## cached inverse

## HOW THESE FUNCTIONS NEED TO BE USED:
## If you have a matrix called x, you first need to used the makeCacheMatrix function
## to create a new object, ex.:
## a <- makeCacheMatrix(x)
## this new object called a can now be used to solve (invert) the matrix, ex.:
## cacheSolve(a)
## The first time it will computate the result, try it at least twice to see the 
## cached version.
## To change the matrix being inverted you don't need to make a new object (list), you
## can change the matrix in the list (a) to a new matrix (z) by using a$set(z)

## makeCacheMatrix creates a list consisting of four functions

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL # m is the object the inverse matrix will be stored in later
  set <- function(y) { # the set function (called with a$set()) enables you to change the matrix originally used (change x) and restores the object that contains the inverse (m) to NULL. It does so in the parent environment, so other functions are influenced by this.
    x <<- y
    m <<- NULL
  }
  get <- function() x # the get function (called with a$get()) returns the original matrix 
  setinv <- function(z) m <<- z # the setinv function stores the inverse matrix (solve) in m. It does so in the parent environment, so other functions are influenced by this.
  getinv <- function() m # the getinv funtion (called with a$getinv()) returns the inversed matrix
  list(set = set, get = get, # makeCacheMatrix creates a list with these four functions
       setinv = setinv,
       getinv = getinv)
}


## cacheSolve retrieves the cached inverse of a given matrix or, if there is no
## previoused cached result, it will compute the inverse. It makes use of the
## functions of makeCacheMatrix

cacheSolve <- function(x, ...) {
  m <- x$getinv() # The function changes m to the result of getinv(), called on x.
  if(!is.null(m)) { # If this has previously been computed it is saved in the parent environment, so it will not be NULL.
    message("getting cached data")
    return(m) # This stops the function and prints m.
  }
  data <- x$get() # A temporary object is made, loading the original matrix, whith which the list was made.
  m <- solve(data, ...) # The matrix gets inverted and saved in m
  x$setinv(m) # The setinv() function gets called, storing the inverse in the parent environment, meaning the next time m != NULL and the cached version can be accessed.
  m # m, containing the inverse matrix gets printed.
}
