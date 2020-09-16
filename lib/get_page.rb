require 'nokogiri'
require 'open-uri'
require 'xpath'
require 'curb'

require_relative '/home/vorob/Desktop/task/huesos-parser/data/data.rb'


module NokogiriReader 
	def NokogiriReader.get_page
		doc = Nokogiri::HTML(open(URL))
	end
  end