# See README.md for instructions in how to run the code and get output from it
# The assignment states that running the code is not part of the grading 
# but I have the instructions anyway.

# makeCacheMatrix is a function that returns a list of functions
# Its purpose is to store a matrix and a cache value of the inverse of the 
# matrix. 
# Contains the following functions:
# * setMatrix      set matrix
# * getMatrix      get matrix
# * setInverse     get the cached value of the inverse of the matrix
# * getInverse     get the cached value of the inverse of the matrix
#
# This function can be called without arguments. In this case, it will create
# a empty matrix (x=matrix())
makeCacheMatrix <- function(x = matrix()) {
    
    # holds the cached value or NULL if nothing is cached
    # initially nothing is cached so set it to NULL
    cache <- NULL
    
    # store a matrix
    setMatrix <- function(newValue) {
        x <<- newValue
        # since the matrix is assigned a new value, flush the cache
        cache <<- NULL
    }
    
    # returns the stored matrix
    getMatrix <- function() {
        x
    }
    
    # cache the given argument 
    setInverse <- function(solve) {
        cache <<- solve
    }
    
    # get the cached value
    getInverse <- function() {
        cache
    }
    
    # return a list. Each named element of the list is a function
    list(setMatrix = setMatrix, getMatrix = getMatrix, setInverse = setInverse, getInverse = getInverse)
}


# The following function calculates the inverse of a "special" matrix created with 
# makeCacheMatrix
cacheSolve <- function(x, ...) {
    # get the cached value
    inverse <- x$getInverse()
    # if a cached value exists return it
    if(!is.null(inverse)) {
        message("getting cached data")
        return(inverse)
    }
    # otherwise get the matrix, caclulate the inverse and store it in
    # the cache
    data <- x$getMatrix()
    inverse <- solve(data)
    x$setInverse(inverse)
    
    # return the inverse
    inverse
}


