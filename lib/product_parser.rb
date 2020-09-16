require_relative 'get_page'

class ProductParser
    include NokogiriReader

    attr_accessor :name, :cost, :image_url, :doc
    
	def initialize(product_name, cost, image_url, doc)
		@name = product_name
		@cost = cost
        @image_url = image_url
        @doc = NokogiriReader::get_page
	end

	def get_name(name, doc)
        product_name = doc.xpath(NAME).text.strip
        return product_name
    end

    def get_img(img, doc)
        product_img = doc.xpath(IMAGE)
        return product_img
    end

    def get_price(price, doc)
        product_price = doc.xpath(PRICE).text.strip
        return product_price
    end
end