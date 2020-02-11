class AttractionController < ApplicationController

    get "/attractions" do
    
        @attractions = Attraction.all
        erb:"/attractions/index"
    end

    get "/attractions/new" do
        erb:"/attractions/new"
    end

    post "/attractions" do
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

    get "/attractions/:id/edit" do
        @attraction = Attraction.find(params[:id])
        if @attraction.user == Helpers.current_user(session)
           erb:"/attractions/edit"
        else
            redirect to("/users/signup")
    end

    patch "/attractions/:id" do
        @attraction = Attraction.find(params[:id])
        
        if @attraction.user == Helpers.current_user(session)
            if !params[:attraction][:visited]
                params[:attraction][:visited] = false
            end
            
            @attraction.update(params[:attraction])
        end
            redirect to("/attractions/#{@attraction.id}")
        end
    end

    delete "/attractions/:id" do
        @attraction = Attraction.find(params[:id])
        if @attraction.user == Helpers.current_user(session)
            @attraction.delete
            redirect to("/attractions")
        else
            redirect to ("/attractions/#{@attraction.id}"
        end
    end


end
