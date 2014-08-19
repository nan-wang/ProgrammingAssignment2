## 'makeCacheMatrix(x)' creates a wrapper of a matrix with its inverse cached
## returns a list of functions used to operate on the matrix and its inverse,
## which is used by cacheSolve()
makeCacheMatrix <- function(x = matrix()) {
  ## 'x': a numeric matrix, which is assumed to be invertible
  
  ## Return a list of functions:
  ## 'set(new_x)': set the current matrix to a new matrix
  ## 'get()': get the current matrix
  ## 'set_inverse(new_inv)': set the cached matrix inverse to a new value
  ## 'get_inverse()': get the current matrix
  
  inv_x <- NULL
  set <- function(new_x) {
    ## 'new_x': a new matrix
    x <<- new_x
    inv_x <<- NULL
  }
  get <- function() {
    ## Return the current matrix
    x
  }
  set_inverse <- function(new_inv) {
    ## 'new_inv': a new matrix inverse
    inv_x <<- new_inv
  }
  get_inverse <- function() {
    ## Return the current matrix inverse
    inv_x
  }
  list(set=set, get=get, 
       set_inverse=set_inverse, get_inverse=get_inverse)
}

## 'cacheSolve()' calculate the inverse of the cached matrix.
## If the inverse of the matrix has been cached, return the cached inverse,
## else calculate the inverse matrix, save it to the cache and return it.
cacheSolve <- function(cached_x, ...) {
  ## 'cached_x': a list of functions that is returned by makeCacheMatrix
  
  ## Return a matrix that is the inverse of 'cached_x'
  inv_x <- cached_x$get_inverse()
  if(!is.null(inv_x)){
    message("getting cached data")
    return(inv_x)
  }
  data <- cached_x$get()
  new_inv <- solve(data)
  cached_x$set_inverse(new_inv)
  new_inv
}
