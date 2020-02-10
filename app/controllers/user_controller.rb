class UserController < ApplicationController

    get "/users/login" do
        erb:"/users/login"
    end
    get "/users/logout" do
        erb:"/users/logout"
    end

    get "/users/signup" do
        erb:"/users/signup"
    end

    post "/users/signup" do
        binding.pry
        if User.find_by(username:params[:user][:username]) 
            redirect to("/users/signup")
        elsif params[:user][:password] != params[:password_confirm]
            redirect to("/users/signup")
        else
          @user = User.create(params[:user])
          session[:user_id] = @user.id
          redirect to("/attractions")
        end
    end

    post "/users/login" do
        @user = User.find_by(username:params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            erb:"/attractions/index"
        else
         redirect to("/users/failure")
        end

    
    end

    post'/users/logout' do
        session.clear
        redirect '/'
      end
    

    get "/users/failure" do
        erb:"/users/login"
    end

end
