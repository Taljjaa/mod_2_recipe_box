class SessionsController < ApplicationController
    def new 
    end

    def create 
        user = User.find_by(username: params[:session][:username])
        if user 
            if user.authenticate(params[:session][:password])
                session[:user_id] = user.id
                redirect_to recipes_path
            else 
                flash[:errors] = "Password or username does not match. Try again"
                redirect_to "/login"
            end
        else 
            flash[:errors] = "You must Sign Up first"
            redirect_to "/login"
        end
    end
end