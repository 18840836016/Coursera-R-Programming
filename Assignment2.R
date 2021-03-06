makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  
  set<-function(y){
    x<<-y
    m<<-NULL
  }

  get <- function() {

    x
  }

  setInverse <- function(inverse) {
    i <<- inverse
  }

  getInverse <- function() {
    m
  }
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)

}


cacheSolve <- function(x, ...) {
        m <- x$getInverse()
        if( !is.null(m) ) {
          message("getting cached data")
          return(m)
        }
        data <- x$get()
        m <- solve(data) %*% data
        x$setInverse(m)
        m      
}
