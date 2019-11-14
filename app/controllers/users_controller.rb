class UsersController < ApplicationController
    def index
        @users = User.all
    end

    def new 
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to '/'
        else 
            flash[:message] = "Username is taken. Please try again."
            render :new
        end
    end

    def show 
        
    end

    private 
    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
