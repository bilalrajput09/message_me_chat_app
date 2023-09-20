class UsersController < ApplicationController

    def new
    end

    def create 
        user = User.new(users_params)
        if user.save 
            flash[:notice] = "User created successfully"
            redirect_to login_path
        else
            flash.now[:alert] = "User is not created try again!"
            render new
        end
    end

    private

    def users_params
        params.require(:user).permit(:username, :password)
    end

end