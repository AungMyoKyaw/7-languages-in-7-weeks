# Write a simple grep that will print the lines of a file having any
# occurrences of a phrase anywhere in that line. You will need to do
# a simple regular expression match and read lines from a file. (This
# is surprisingly simple in Ruby.) If you want, include line numbers.

def search()
  lno = 0;
  keyword = ARGV[1]
  lines = ARGF.file.readlines()
  regex = /#{keyword}/i
  lines.each {
    |line| 
    lno +=1
    if regex.match(line)
      puts "#{lno}✔︎ #{line}"
    end
  }
end

search
