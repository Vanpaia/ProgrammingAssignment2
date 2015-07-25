## This is a pair of functions, the first creates a list of different functions for 
## use by the second function, which computates the inverse of a given matrix or, if
## the inverse of that given matrix has already been computed, simply returns the
## cached inverse

## makeCacheMatrix creates a list consisting of four functions

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL # m is the object the inverse matrix will be stored in later
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x # the get function (called with x$get()) returns the original matrix 
  setinv <- function(solve) m <<- solve 
  getinv <- function() m # the getinv funtion (called with x$getinv()) returns the inversed matrix
  list(set = set, get = get, # makeCacheMatrix creates a list with these four functions
       setinv = setinv,
       getinv = getinv)
}


## cacheSolve retrieves the cached inverse of a given matrix or, if there is no
## previoused cached result, it will compute the inverse. It makes use of the
## functions of makeCacheMatrix

cacheSolve <- function(x, ...) {
  m <- x$getinv()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinv(m)
  m
}
