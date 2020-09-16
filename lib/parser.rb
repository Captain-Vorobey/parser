require 'ostruct'

class Parser
    def initialize(scraper)
        @scraper = scraper
        @file_name_pattern = /^\w+$/
      end

    def check_args(arg_v)
        if ARGV.length != 2
            puts "We need exactly two arguments"
            exit
        end
      end
      
      def run(arg_v)
        for i in 0 ... arg_v.length
            puts "#{i} #{arg_v[i]}"
         end
      end
    
      private
    
      
end