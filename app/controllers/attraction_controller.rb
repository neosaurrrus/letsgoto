class AttractionController < ApplicationController

    get "/attractions" do
    
        @attractions = Attraction.all
        erb:"/attractions/index"
    end

    get "/attractions/new" do
        erb:"/attractions/new"
    end

    post "/attractions" do
        binding.pry
        if params[:attraction][:comments] == ""
            redirect to("/attractions/new")
        else 
            @attraction = Attraction.create(params[:attraction])
            @attraction.user = Helpers.current_user(session)
            @attraction.save
            redirect to("/attractions/#{@attraction.id}")
        end
    end

    get "/attractions/:id" do
        @attraction = Attraction.find(params[:id])
        erb:"/attractions/show"
    end

    



end
