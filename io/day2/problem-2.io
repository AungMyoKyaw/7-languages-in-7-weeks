/* How would you change / to return 0 if the denominator is zero? */
"Before => " println
(1/0) println

Number orignal := Number getSlot("/")

Number / = method(
    den,
    if(den==0, 0, orignal(den))
    ) 

  "After => " println
  (1/0) println
