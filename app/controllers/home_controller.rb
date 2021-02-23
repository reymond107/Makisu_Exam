class HomeController < ApplicationController
    def website
        @web_query = params[:website]
        @date = params[:date].to_datetime
          
        require 'net/http'
        require 'json'
        response = Net::HTTP.get(URI.parse('https://isitdown.site/api/v3/'  + @web_query + "##{@date}"))
        @output = JSON.parse(response)
    end
      
end
