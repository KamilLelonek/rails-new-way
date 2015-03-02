class RootController < ApplicationController
  def index
    render json: {
             ingredients: "#{root_url}ingredients",
           }
  end
end
