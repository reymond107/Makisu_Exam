class SearchesController < ApplicationController
    
    def index
        @searches = Search.all
    end
  
    def create
        @web_query = params[:website]
        @date = params[:date].to_datetime
          
        require 'net/http'
        require 'json'
        response = Net::HTTP.get(URI.parse('https://isitdown.site/api/v3/'  + @web_query + "##{@date}"))
        @output = JSON.parse(response)

        if @search = Search.new(website: @output['host'], status: @output['response_code'], date: @date)
          if @search.save
            flash[:success] = "Object successfully created"
            redirect_to searches_path
          else
            flash[:error] = "Something went wrong"
            render 'new'
          end
        end
    end
  
     
    def destroy
      @search = Search.find(params[:id])
      if @search.destroy
        flash[:success] = 'Object was successfully deleted.'
        redirect_to searches_path
      else
        flash[:error] = 'Something went wrong'
        redirect_to searches_path
      end
    end
  
end
