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
        if User.find_by(username:params[:user][:username]) 
            flash[:sign_in_notice]= "Username has been taken!"
            redirect to("/users/signup")
        elsif params[:user][:password].length < 8
            flash[:sign_in_notice]= "Please use a minimum of 8 characters for the password!"
            redirect to("/users/signup")
        elsif params[:user][:password] != params[:password_confirm]
            flash[:sign_in_notice]= "Passwords do not match!"
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
            @attractions = Attraction.all
            flash[:index_notice] = "Welcome #{@user.username}!"
            redirect to("/attractions")
        else
         redirect to("/users/failure")
        end
    end

    post'/users/logout' do
        session.clear
        flash[:logout_notice]= "Successfully Logged Out"
        redirect '/'
    end
    

    get "/users/failure" do
        flash[:login_notice]= "Invalid Username or Password"
        redirect to("/users/login")
    end

end
