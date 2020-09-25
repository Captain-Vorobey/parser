require_relative 'get_page'
require_relative '/home/vorob/Desktop/task/huesos-parser/data/data.rb'
require_relative 'adding_parsed_array'

require_relative 'product_parser'
require_relative 'parse_page'

class PetsonicParser
    def self.parse_single_category(http)
      doc = Nokogiri::HTML(http.body_str)
      links = []
      doc.xpath('//link[@itemprop = "url"]').each { |row| links.push(row['href']) }
      links
    end
  
    def self.category_with_sub?(http)
      doc = Nokogiri::HTML(http)
      id = doc.xpath('//div[@id = "subcategories"]')
      id.empty?
    end
  
    def self.parse_category_with_sub(http)
      doc = Nokogiri::HTML(http.body_str)
      links = []
      doc.xpath('//a[@class = "product_img_link pro_img_hover_scale product-list-category-img"]')
         .each { |row| links.push(row['href']) }
      links
    end

  def self.goods_info(urls)
    responses = {}
    m = Curl::Multi.new
    urls.each do |url|
      responses[url] = Curl::Easy.new(url)
      m.add(responses[url])
    end
    m.perform
    responses
  end

  def self.add_result(goods_info, urls, responses)
    error_links = []
    urls.each do |url|
      goods_info.push(PensonicParser.parse_good(responses[url]))
    rescue StandardError
      p 'scarping error'
      p url
      error_links.push(url)
    end
    error_links
  end

  def self.scrape_goods_info(urls)
    goods_info = []
    responses = goods_info(urls)
    error_urls = add_result(goods_info, urls, responses)
    if (goods_info.length - error_urls.length) != goods_info.length
      p 'retry'
      responses1 = goods_info(error_urls)
      error_urls1 = add_result(goods_info, error_urls, responses1)
      unless error_urls1.empty?
        p 'urls not add '
        error_urls.each do |url|
          p url
        end
      end
    end
    p goods_info.length.to_s + ' is done'
    goods_info
  end
  
    def self.check_url(url)
        if category_with_sub?(url)
            arr = []
            arr = category_goods(url)
            newArr = []
            for item in arr
              newArr.push(AddingParsedArray.push_to_product(arr))
            end
            newArr
        else
            AddingToParser.push_to_products
        end
    end

    def self.category_goods(main_url)
      http = Curl.get(main_url)
      temp = []
      links = parse_category_with_sub(http)
      i = 2
      loop  do
        url = main_url + "?p=#{i}"
        http = Curl.get(url)
        temp = parse_category_with_sub(http)
        break if temp.empty?
  
        temp.each do |item|
          links.push(item)
        end
        i += 1
      end
      p links
      links
    end
  end