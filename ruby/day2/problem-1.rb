# Print the contents of an array of sixteen numbers, four numbers
# at a time, using just each. Now, do the same with each_slice in
# Enumerable.

def main
  array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
  array.each_slice(4) { |item| p item}
end

main()
