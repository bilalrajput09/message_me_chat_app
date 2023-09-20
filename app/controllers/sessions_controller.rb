class SessionsController < ApplicationController

    before_action :redirect_logged_in_user, only: [:new, :create]

    def new
    end

    def create 
        user = User.find_by(username: params[:session][:username])
        if user && user.authenticate(params[:session][:password])
            flash[:success] = "You are successfully logged in."
            session[:user_id] = user.id 
            redirect_to root_path
        else
            flash.now[:error] = "Either your password or username incorrect."
            render "new"
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "You are successfully logged out."
        redirect_to root_path
    end

    private
    def redirect_logged_in_user
        if logged_in?
            flash[:error] = "You are already logged in."
            redirect_to root_path
        end
    end
end