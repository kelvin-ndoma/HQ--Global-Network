class HomeController < ApplicationController
    def index
        render json: { status: "hey hey" }
    end
end
