require 'xpath'

require_relative '/home/vorob/Desktop/task/huesos-parser/data/data.rb'
require_relative 'product_parser'
require_relative 'get_page'
require_relative 'parse_page'

class AddingParsedArray

    attr_accessor :products, :doc

    def initialize(products, doc)
        @products = products
        @doc = NokogiriReader::get_page
    end

    def size()
        puts items_count = @doc.xpath("//img[@width='250']/@src").size
    end

    def self.push_to_products
        product = ProductParser.new(NAME, PRICE, IMAGE, doc)
                
        product_name = product.get_name(NAME, doc) 
        product_cost = product.get_price(PRICE, doc)
        product_image = product.get_img(IMAGE, doc)

        products.push(ProductParser.new(product_name, product_cost, product_image, doc))
    end

    def self.push_to_product(arr)

        for item in arr
            product = ProductParser.new(NAME, PRICE, IMAGE, item)
                
        product_name = product.get_name(NAME, item) 
        product_cost = product.get_price(PRICE, item)
        product_image = product.get_img(IMAGE, item)

        products.push(ProductParser.new(product_name, product_cost, product_image, doc))
        end
        products
    end
end