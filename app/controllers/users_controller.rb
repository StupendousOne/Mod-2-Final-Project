class UsersController < ApplicationController

    before_action :find_user, only:[:show, :private_page, :destroy]
    before_action :is_current_user, only: [:edit]

    def new
        @user = User.new
        render :layout => false
    end

    def create
        
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            flash[:success] = "User Created"
            session[:user_id] = @user.id

            redirect_to houses_path, :layout => false
        else
            flash[:warning] = "Invalid Email or Password"
            render :new, :layout => false
        end
    end

    def show

        @other_user = User.find_by(id: params[:id])
        if @user == current_user
            render :private_page
        end
    end

    def private_page
    end

    def destroy
        @user.deactivated = true
        session[:user_id] = nil
        @user.save!
        byebug
        redirect_to '/'
    end

    private

        def user_params
            params.require(:user).permit(:show_name, :name, :email, :password, :password_confirmation, :deactivated)
        end

        def find_user
            @user = User.find_by(id: params[:id])
        end
end
