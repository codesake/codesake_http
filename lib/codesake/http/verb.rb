require 'net/https'
require 'uri'

module Codesake
  module HTTP

    ## This should move in a codesake_http standalone gem for all the HTTP stuff
    class Options
      def self.request(url)
        uri = URI.parse(url)
        http = Net::HTTP.new(uri.host, uri.port)
        
        request = Net::HTTP::Options.new("/")
        request.initialize_http_header({"User-Agent" => "codesake-http v#{Codesake::HTTP::VERSION}"})
        begin
          response = http.request(request)
        rescue
          response = nil

        end
      end
    end

    class Verb

      def self.evaluate(url)
        response = Codesake::HTTP::Options.request(url)
        return {:status=>:KO} if response.nil?
      end
    end
  end
end
