# write a program that picks a random number. Let a player guess the
# number, telling the player whether the guess is too low or too high.

def guess
  puts "Guess my number >> "
  myNumber = rand(1e3)
  userNumber = gets().to_i
  if userNumber > myNumber
    puts "TOO HIGH"
  elsif userNumber < myNumber
    puts "TOO LOW"
  else
    puts "WTF IS GOING ON"
  end
end

guess()
