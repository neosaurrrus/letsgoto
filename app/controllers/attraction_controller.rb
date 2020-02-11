class AttractionController < ApplicationController

    get "/attractions" do
    
        @attractions = Attraction.all
        erb:"/attractions/index"
    end

    get "/attractions/new" do
        erb:"/attractions/new"
    end

    post "/attractions" do
        if params[:comments].length == 0
            redirect to("/attactions/new")
        else 
            @attraction = Attraction.create(params)
            @attraction.user = Helpers.current_user(session)
            @attraction.save
            redirect to("/attractions/#{@attraction.id")
        end

    end


end
