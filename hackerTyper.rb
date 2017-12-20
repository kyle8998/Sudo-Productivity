require 'open-uri'
code = open("http://hackertyper.com/code.txt")
system 'cls'
system("color 0a")

code.each_char  do |char|
    print char
    sleep rand(10) / 30.0
 end
