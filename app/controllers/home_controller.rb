class HomeController < ApplicationController
    def index
        render json: {
            "message": "REST Fullstack Challenge 20201209 Running"
        }
    end
  end