require 'open-uri'
require 'nokogiri'
site = "http://codereview.stackexchange.com/"
system 'cls'
system("color 0a")
5.times do
    begin
        id = rand(1..6000)
        url = "#{site}/a/#{id}"
        page = Nokogiri::HTML(open(url))
        code = page.css('code')[0].text
    end until code

    code.each_char  do |char|
        print char
        sleep rand(10) / 30.0
    end
end