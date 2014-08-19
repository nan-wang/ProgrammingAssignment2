## This is a test file for checking the basic functions of the implementations.
## Basically, we initialize the cached matrix with 
# [,1] [,2]
# [1,]    1    3
# [2,]    2    4
## First, we calculate the inverse by directly using `makeCacheMatrix`
## and check the functions in `makeCacheMatrix`.
## Afterwards, we set the cached matrix to its inverse
## and calculate the inverse with `cacheSolve`.

setwd('.')
source('cachematrix.R')
## test code
foo_mat <- matrix( 1:4, nrow=2, ncol=2)

# test 1 makeCacheMatrix
cached_mat <- makeCacheMatrix(foo_mat)
## test 1.1: get
cached_mat$get()
### expected result
# [,1] [,2]
# [1,]    1    3
# [2,]    2    4
## test 1.2: set_inverse
new_inv <- solve(foo_mat)
cached_mat$set_inverse(new_inv)
## test 1.3: get_inverse
cached_mat$get_inverse()
### expected result
# [,1] [,2]
# [1,]   -2  1.5
# [2,]    1 -0.5
## test 1.4: set
foo_mat <- cached_mat$get_inverse()
cached_mat$set(foo_mat)
cached_mat$get()
### expected result
# [,1] [,2]
# [1,]   -2  1.5
# [2,]    1 -0.5
cached_mat$get_inverse()
### expected result
# NULL

# test 2 cacheSolve
cacheSolve(cached_mat)
### expected result
# [,1] [,2]
# [1,]    1    3
# [2,]    2    4
cacheSolve(cached_mat)
### expected result
# getting cached data
# [,1] [,2]
# [1,]    1    3
# [2,]    2    4
