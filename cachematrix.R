

## Creates a special matrix object that cache its inverse
makeCacheMatrix <-function(x = matrix()) {
  
  ## Initialize the inverse property
  inverseproperty <- NULL
  
  ## A method to set the matrix
  set <- function(y) {
    x <<- y
    inverseproperty <<- NULL
  }
  
  ## A method to get the matrix
  get <- function() x 
  
  ## A method that set the inverse of the matrix
  setinverse <- function(inverse) inverseproperty <<- inverse 
  
  ## A method to get the inverse of the matrix
  getinverse<- function() inverseproperty
  
  ## Return  a list of the functions
  list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


## Compute the inverse of the special matrix returned by "makeCacheMatrix"above. If the inverse has already been
## calculated (and the matrix has not changed), then the "cachesolve" should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  
  ## Return a matrix that is the inverse of 'x'
  inverseproperty <- x$getinverse()
  
  ## Just return the inverse if its already set
  if(!is.null(inverseproperty)) {
    message("getting cached data.")
    return(inverseproperty)
  }
  
  ## Get the matrix from the object
  data <-x$get()
  ## Calculate the inverse using matrix multiplication
  inverseproperty <- solve(data)
  ## Set the inverse to the object
  x$setinverse(inverseproperty)
  ## Return the matrix
  inverseproperty
}

