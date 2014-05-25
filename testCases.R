## this is a collection of test cases that the user Gero Schmidt in my class
## submitted. It makes use of the "magic" package. To install that, run the following

#install.packages("magic")

library(magic)
A<-magic(5)
A

## sample output
##
## > A
## [,1] [,2] [,3] [,4] [,5]
## [1,]    9    2   25   18   11
## [2,]    3   21   19   12   10
## [3,]   22   20   13    6    4
## [4,]   16   14    7    5   23
## [5,]   15    8    1   24   17

## cache the inverse of our magic 5x5 matrix
B<-makeCacheMatrix(A)

## you can see the names of the functions returned here
names(B)

## [1] "set"      "get"      "setSolve" "getSolve"

## we should have the original matrix show up when calling get()
B$get()

##      [,1] [,2] [,3] [,4] [,5]
## [1,]    9    2   25   18   11
## [2,]    3   21   19   12   10
## [3,]   22   20   13    6    4
## [4,]   16   14    7    5   23
## [5,]   15    8    1   24   17

## when we call the getSolve() to retrieve the matrix we get null
B$getSolve()

## NULL

## let's cacluate the inverse
cacheSolve(B)

##              [,1]         [,2]         [,3]         [,4]         [,5]
## [1,]  0.011089744 -0.045000000  0.041538462  0.005000000  0.002756410
## [2,] -0.036987179  0.043461538  0.010769231 -0.006538462  0.004679487
## [3,]  0.036410256  0.003076923  0.003076923  0.003076923 -0.030256410
## [4,]  0.001474359  0.012692308 -0.004615385 -0.037307692  0.043141026
## [5,]  0.003397436  0.001153846 -0.035384615  0.051153846 -0.004935897

## let's call it again, this time it should be pulled from the cache
cacheSolve(B)
## getting cached data
##              [,1]         [,2]         [,3]         [,4]         [,5]
## [1,]  0.011089744 -0.045000000  0.041538462  0.005000000  0.002756410
## [2,] -0.036987179  0.043461538  0.010769231 -0.006538462  0.004679487
## [3,]  0.036410256  0.003076923  0.003076923  0.003076923 -0.030256410
## [4,]  0.001474359  0.012692308 -0.004615385 -0.037307692  0.043141026
## [5,]  0.003397436  0.001153846 -0.035384615  0.051153846 -0.004935897
