class DashboardController < ApplicationController
    require 'json'
    require 'httparty'

    def index
        # Get Board Name
        result = HTTParty.get(
            "https://api.trello.com/1/boards/#{ENV['TRELLO_BOARD_ID']}?fields=name&key=#{ENV['TRELLO_KEY']}&token=#{ENV['TRELLO_SERVER_KEY']}", 
            :headers => { 'Content-Type' => 'application/json' }
        )
        if result.code.to_s == "200" 
            body = JSON.parse(result.body)
            @board = body["name"]
            
            # Get lists and cards
            result = HTTParty.get(
                "https://api.trello.com/1/boards/#{ENV['TRELLO_BOARD_ID']}/lists?cards=all&fields=name&key=#{ENV['TRELLO_KEY']}&token=#{ENV['TRELLO_SERVER_KEY']}", 
                :headers => { 'Content-Type' => 'application/json' }
            )
            if result.code.to_s == "200" 
                @lists = JSON.parse(result.body)
            end
        end
    end

    def new 
        if params[:title].present?
            card = {:idList => '618d1f8711a48653e376aaac', :name => params[:title]}
            result = HTTParty.post(
                "https://api.trello.com/1/cards?#{ENV['TRELLO_BOARD_ID']}?fields=name&key=#{ENV['TRELLO_KEY']}&token=#{ENV['TRELLO_SERVER_KEY']}", 
                :body => card.to_json, 
                :headers => { 'Content-Type' => 'application/json' }
            )
            redirect_to "/"
        end
    end

end