class RootController < ApplicationController
  def index
    render json: {
             ingredients: "#{root_url}ingredients",
             categories:  "#{root_url}categories",
             deliveries:  "#{root_url}deliveries",
           }
  end
end
