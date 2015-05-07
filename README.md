# Programming Assignment 2: Lexical Scoping

## For the Coursera course [R Programming](https://www.coursera.org/course/rprog)

The following code demonstrates how to use the `cachematrix.R` R script.

Lines starting with `#` are simple comments, lines starting with `#>` are things
printed in the output.

	# read the R script
	# replace the "path/to/file" with the directory you save the file into
	# or you can read the file directly from the web
	source("path/to/file/cachematrix.R")

	# create a *square* matrix (because `solve` only handles square matrices)
	# create the matrix during the call of makeCacheMatrix()
	a <- makeCacheMatrix( matrix(c(2,1,13,12), nrow = 2, ncol = 2) );

	summary(a);
	#>              Length Class  Mode    
	#> setMatrix    1      -none- function
	#> getMatrix    1      -none- function
	#> setInverse   1      -none- function
	#> getInverse   1      -none- function

	a$getMatrix();
	#>      [,1] [,2]
	#> [1,]    2   13
	#> [2,]    1   12

	cacheSolve(a)
	#>             [,1]       [,2]
	#> [1,]  1.09090909 -1.1818182
	#> [2,] -0.09090909  0.1818182

	# the 2nd time we run the function,we get the cached value
	cacheSolve(a)
	#> getting cached data
	#> [,1]        [,2]
	#> [1,]  1.09090909 -1.1818182
    #> [2,] -0.09090909  0.1818182

Alternatively, the matrix can be created after calling a `makeCacheMatrix`
without arguments.

	# read the R script
	# replace the "path/to/file" with the directory you save the file into
	# or you can read the file directly from the web
	source("path/to/file/cachematrix.R")
	
	# call makeCacheMatrix without arguments
	a <- makeCacheMatrix();
	summary(a);
	#>              Length Class  Mode    
	#> setMatrix    1      -none- function
	#> getMatrix    1      -none- function
	#> setInverse   1      -none- function
	#> getInverse   1      -none- function

	# create a square matrix using setMatrix function of a
    #(reason `solve` only handles square matrices )
	a$setMatrix( matrix(c(2,1,13,12), nrow = 2, ncol = 2) );
    a$getMatrix();
	#>      [,1] [,2]
	#> [1,]    2   13
	#> [2,]    1   12

	cacheSolve(a)
	#> [,1]        [,2]
    #> [1,]  1.09090909 -1.1818182
    #> [2,] -0.09090909  0.1818182

	# the 2nd time we run the function, we get the cached value
	cacheSolve(a)
	#> getting cached data
	#> [,1]        [,2]
    #> [1,]  1.09090909 -1.1818182
    #> [2,] -0.09090909  0.1818182

