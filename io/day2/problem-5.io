/* Write a prototype for a two-dimensional list. The dim(x, y) method */
/* should allocate a list of y lists that are x elements long. set(x, y, */
/* value) should set a value, and get(x, y) should return that value. */

Matrix := Object clone do (
            init := method(
              self lists := list()
              )

            dim := method(
              row, col,
              for(i,1,row,
                colM := list()
                for(j,1,col, colM append(nil))
                self lists append (colM))
              )

            get := method(
              row, col,
              self lists at(row) at(col)
              )

            set := method(
              row, col, value,
              self lists atPut(row, self lists at(row) atPut(col,value))
              )
            )

matrix := Matrix clone
matrix dim(2, 3) 
matrix set(0, 1,"test")
matrix get(0, 1) println
