module V1
    class WebhooksController < ApplicationController
        protect_from_forgery with: :null_session
        require 'json'

        def index
            render json:{}, status: 200
        end

        def create
            puts "Incoming webhook:"
            begin
                if params["webhook"]["action"]["display"]["entities"].present?
                    puts "Card '" + 
                        params["webhook"]["action"]["display"]["entities"]["card"]["text"].to_s + "' moved to '" + 
                        params["webhook"]["action"]["display"]["entities"]["listAfter"]["text"].to_s + "'"
                end
            rescue => exception
                puts "Could not process webhook"
            end
                
            render json:{}, status: 200
        end
    end
end