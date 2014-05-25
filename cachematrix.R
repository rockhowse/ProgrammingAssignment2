## Matrix inversion is usually a costly computation and there may be some benefit to 
## caching the inverse of a matrix rather than computing it repeatedly  
## This code contains a pair of functions that cache the inverse of a matrix.

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  
  # set function
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  
  # get function
  get <- function() x

  # setSolve function
  setSolve <- function(solve) m <<- solve
  
  # getSolve function
  getSolve <- function() m
  
  # returned list of all exposed functions defined above
  list(set = set, 
       get = get,
       setSolve = setSolve,
       getSolve = getSolve)
}


## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then cacheSolve should retrieve the inverse from the cache.

## NOTE: this code assumes the supplied matrix is invertible

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getSolve()
  
  # if we found a cached version of the inverse... use it
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  
  # otherwisem let's calculate the inverse using solve() and put it in the cache
  data <- x$get()
  m <- solve(data, ...)
  x$setSolve(m)
  
  # return the inverse we just cached
  m  
}
