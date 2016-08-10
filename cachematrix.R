## makeCacheMatrix is a function that creates a special "matrix" object that can cache its inverse.

## this functions does:1)set the value of a matrix; 2)get the value of the matrix; 3) set the inverse of the matrix; 4) get the inverse
## of that matrix

## For caching the inverse of a matrix

makeCacheMatrix <- function(x = matrix()) {
m <- NULL
set <- function(y){
x <<- y
m <<- NULL
}
get <- function()x
setinverse <- function(solve) m <<-(solve)
getinverse <- function() m
list(set = set, get = get,
setinverse = setinverse,
getinverse = getinverse)
}

#CacheSolve is a function that computes the inverse of the special "matrix" returned by makeCacheMatrix above.
#If the inverse has already been calculated (and the matrix has not changed), then cacheSolve should retrieve the
#inverse from the cache. the function solve() retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinverse()
        if(!is.null(m)){
        message("getting cached data")
        return(m)
}
data <- x$get()
m <- solve(data, ...)
x$setinverse(m)
m
}
