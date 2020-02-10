class AttractionController < ApplicationController

    get "/attractions" do
    
        @attractions = Attraction.all
        erb:"/attractions/index"
    end

    get "/attractions/new" do
        erb:"/attractions/new"
    end

end
