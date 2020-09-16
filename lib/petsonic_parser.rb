require_relative 'get_page'
require_relative '/home/vorob/Desktop/task/huesos-parser/data/data.rb'

class PetsonicParser
    def self.parse_single_category(http)
      doc = Nokogiri::HTML(http.body_str)
      links = []
      doc.xpath('//link[@itemprop = "url"]').each { |row| links.push(row['href']) }
      links
    end
  
    def self.category_with_sub?(http)
      doc = Nokogiri::HTML(http.body_str)
      id = doc.xpath('//div[@id = "subcategories"]')
      id.empty?
    end
  
    def self.parse_category_with_sub(http)
      doc = Nokogiri::HTML(http.body_str)
      links = []
      doc.xpath('//a[@class = "product_img_link pro_img_hover_scale product-list-category-img"]')
         .each { |row| links.push(row['href']) }
      #links

      temp = []
    links = parse_category_with_sub(http)
    i = 2
    
      url = doc + "?p=#{1}"
      http1 = Curl.get(url) 
      Ggg.new([], url).push_to_products
      #temp = parse_category_with_sub(http1)
    Logger.log(links, 'get multi category goods... ')
    links
    end
  
    def self.check_url(url)
        if category_with_sub?(url)
            parse_category_with_sub(url)
        else
            parse_single_category(url)
        end
    end
  end