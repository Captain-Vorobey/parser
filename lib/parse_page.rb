require 'csv'

class ParsePage
    def parse_page(file_name, array)
        CSV.open(file_name + ".csv", "w") do |csv|
            csv << ["Name", "Price", "Image"]
            for item in array
                csv << [item.name, item.cost, item.image_url]
            end
        end
    end
end