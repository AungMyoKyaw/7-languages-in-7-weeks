/* Add a slot called myAverage to a list that computes the average of */
/* all the numbers in a list. What happens if there are no numbers */
/* in a list? (Bonus: Raise an Io exception if any item in the list is not */
/* a number.) */


List myAverage := method(
    average := 0
    e := try(
      average = self sum / self size
      )
    e catch(Exception,
      writeln(e)
      )
    average
    )

list() myAverage println
list(1, 2, 3, 4, 5, 6, 7, 8, 9, 10) myAverage println
