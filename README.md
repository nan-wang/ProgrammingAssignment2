### Assignment: Caching the Inverse of a Matrix
The main file `cachematrix.R` includes two functions,

1.  `makeCacheMatrix`: This function creates a special "matrix" object
    that can cache its inverse.
2.  `cacheSolve`: This function computes the inverse of the special
    "matrix" returned by `makeCacheMatrix` above. If the inverse has
    already been calculated (and the matrix has not changed), then
    `cacheSolve` should retrieve the inverse from the cache.

Computing the inverse of a square matrix can be done with the `solve`
function in R. For example, if `X` is a square invertible matrix, then
`solve(X)` returns its inverse.

For this assignment, assume that the matrix supplied is always
invertible.

### Implementation:

1. `cachematrix.R`: the main implementations
2. `test_cachematrix.R`: the testing file including the test cases for the basic functionalities.
