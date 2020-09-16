require_relative 'parser'
require_relative 'ggg'
require_relative 'petsonic_parser'

require_relative '/home/vorob/Desktop/task/huesos-parser/data/data.rb'

puts "Wait a bit please..."

html = Curl.get(URL)

array = AddingParsedArray.new([], html).push_to_products

for item in array 
	p item.name
end

def array.arr_to_file(arr)
	return ParsePage.new().parse_page(FILE_NAME, arr)
end



parser = Parser.new(array.arr_to_file(array))
parser.run(ARGV)

puts "The file is written!"

#add all ul-list from https://www.petsonic.com/snacks-huesos-para-perros/?p=2 and make xpath '?p=2'

#find the button 'Cargar más productos' and if I found this button I have to add subcategories '?p1 p2 p3' (loop)

#p PetsonicParser.parse_category_with_sub(html)