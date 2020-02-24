
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
            flash[:notice]="Please provide a comment!"
            redirect to("/attractions/new")
        else 
            @attraction = Helpers.current_user(session).attractions.build(params[:attraction])
            # @attraction.user = Helpers.current_user(session)
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
        elsif !Helpers.is_logged_in?(session)
            flash[:edit_notice]="You need to log in to edit attractions"
            redirect to("/users/login")
        else
            flash[:show_notice]="You are not the owner of this attraction!"
            redirect to ("/attractions/#{@attraction.id}")
        end
    end

    patch "/attractions/:id" do
        @attraction = Attraction.find(params[:id])
        if @attraction.user == Helpers.current_user(session)
            if !params[:attraction][:visited] # If the visited checkbox is unchecked it wont appear in params...
                params[:attraction][:visited] = false # ...so I force it to appear
            end
            @attraction.update(params[:attraction])
        end
        redirect to("/attractions/#{@attraction.id}")
    end

    delete "/attractions/:id" do
        @attraction = Attraction.find(params[:id])
        if @attraction.user == Helpers.current_user(session)
            @attraction.delete
            redirect to("/attractions")
        else
            redirect to ("/attractions/#{@attraction.id}")
        end
    end


end
