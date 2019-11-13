class UsersController < ApplicationController
    def new 
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            redirect_to '/'
        else 
            flash[:message] = "Username is taken. Please try again."
            render :new
        end
    end

    private 
    def user_params
        params.require(:user).permit(:username)
    end
end
