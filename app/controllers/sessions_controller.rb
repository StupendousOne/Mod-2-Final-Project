class SessionsController < ApplicationController
    def new
        render :layout => false
    end
    
    def create
        @user = User.find_by(name: params[:name])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            flash[:alert] = "User Successfully Signed In"
            redirect_to houses_path
        else
            flash[:alert] = "Username or Email is Invalid. Please Try Again."
            redirect_to login_path
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "Successfully Logged Out!"
        redirect_to '/login'
    end
end
