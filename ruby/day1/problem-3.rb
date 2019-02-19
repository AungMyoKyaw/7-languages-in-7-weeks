# Print your name ten times.

def print(name)
  count = 10
  while count > 0 
    count -= 1
    puts "< #{name} >".center(40,"-")
  end
end

print("Aung Myo Kyaw");
