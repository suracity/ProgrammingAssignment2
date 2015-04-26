## Following functions create an object that stores a matrix and cache its inverse.

## Very similiar to the given example, MakeCacheMatrix is to 
## 1. set the value of the matrix
## 2. get the value of the matrix
## 3. set the value of the inverse of the matrix
## 4. get the value of the inverse of the matrix
## *solve() is to calucalte the inverse of matrix

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## cacheSolve is to get the inverse of matrix from the object created by makeCacheMatrix. Firstly it checks if the
## compuatation is finished, if so it obtains the result from cache, otherwise it calculates and use setsolve() to
## set value in the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
          m <- x$getsolve()
          if(!is.null(m)) {
            message("getting cached data")
            return(m)
          }
          data <- x$get()
          m <- solve(data, ...)
          x$setsolve(m)
          m
}
