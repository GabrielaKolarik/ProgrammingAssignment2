## Put comments here that give an overall description of what your functions do


##Assignment: Caching the Inverse of a Matrix

#Matrix inversion is usually a costly computation and there may be some benefit to caching the inverse of a matrix rather than computing it repeatedly (there are also alternatives to matrix inversion that we will not discuss here). Your assignment is to write a pair of functions that cache the inverse of a matrix.


## Write a short comment describing this function
# This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
# Initialize the inverse property
  i <- NULL
  
# Method to set the matrix
  set <- function(matrix) {
    m <<- matrix
    i <<- NULL
  }
# Method the get the matrix
  get <- function() {m}
  
# Method to set the inverse of the matrix
  setinverse <- function(inverse) {
    i <<- inverse
  }
  
# Method to get the inverse of the matrix
  getinverse <- function() {
    
# Return the inverse property
    i
  }
  
# Return a list of the methods
  list(set=set, get=get, setInverse=setInverse, getInverse=getInverse)
}


## Write a short comment describing this function
# This function computes the inverse of the special "matrix" returned by `makeCacheMatrix` above. If the inverse has already been calculated (and the matrix has not changed), then cacheSolve` should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  
# Return a matrix that is the inverse of 'x'
  m <- x$getInverse()
  
# Just return the inverse if its already set
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
# Get the matrix from our object
  data <- x$get()
  
# Calculate the inverse using matrix multiplication
  m <- solve(data) %*% data
  
# Set the inverse to the object
  x$setInverse(m)
  
# Return the matrix
  m
}
