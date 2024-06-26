## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  inv<-NULL            #initializing inverse as NULL
  set<-function(y){
                  x<<-y
                  inv<<-NULL
                   }
  get<-function()x             #function to get matrix x
  setinv<-function(inverse)inv<<-inverse
  getinv<-function(){ 
                    inver<-ginv(x)
                    inver%*%x           #function to obtain inverse of the matrix
                    }
  list(set = set, get = get, 
       setinv = setinv, 
       getinv = getinv)
}


## Write a short comment describing this function
## used for cache data
cacheSolve <- function(x, ...) {
  inv<-x$getinv()                  
  if(!is.null(inv)){                 #checking whether inverse is NUll 
                     message("getting cached data!")
                     return(inv)                       #returns inverse value
  }
  data<-x$get()
  inv<-solve(data,...)              #calculates inverse value
  x$setinv(inv)
  inv 
        ## Return a matrix that is the inverse of 'x'
}
