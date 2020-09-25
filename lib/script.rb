#!/usr/bin/env ruby

require_relative 'parser'
require_relative 'adding_parsed_array'
require_relative 'petsonic_parser'

require_relative '../data/data.rb'

puts "Wait a bit please..."

html = Curl.get(URL)

#array = AddingParsedArray.new([], html).push_to_products

#for item in array 
#	p item.name
#end

arr = []
arr = PetsonicParser.check_url(URL)

for item in array 
	p item.name
end

parser = Parser.new(arr)
parser.run(ARGV)


puts "The file is written!!!!!"

puts "The file was written!"


#add all ul-list from https://www.petsonic.com/snacks-huesos-para-perros/?p=2 and make xpath '?p=2'

#find the button 'Cargar más productos' and if I found this button I have to add subcategories '?p1 p2 p3' (loop)



#PetsonicParser.category_goods(URL)

#p PetsonicParser.parse_category_with_sub(html)
