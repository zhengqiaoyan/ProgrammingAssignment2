 ## The first function creates a special matrix object that can cache its inverse 
 ## The second function computes the inverse of the matrix returned by 
 ## makeCacheMatrix
 
 ## Create a matirx

makeCacheMatrix <- function(x = matrix()) {
 m<-NULL 
      set<-function(y){ 
          x<<-y 
          m<<-NULL 
        } 
      get<-function() x 
      setinverse<-function(solve) m<<-solve 
      getinverse<-function() m 
      list(set=set, get=get, setinverse=setinverse, getinverse=getinverse) 
    } 

}


 ##Computes the inverse  

cacheSolve <- function(x, ...) {
m<-x$getinverse() 
      if(!is.null(m)){ 
          message("getting cached data") 
          return(m) 
        } 
      data<-x$ger() 
      m<-solve(data,...) 
      x$setinverse(m) 
      m 
}
