class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            flash[:success] = "User Created!"
            redirect_to user_path(@user)
        else
            flash[:warning] = "Invalid Email or Password"
            render :new
        end
    end

    def show
        @user = User.find_by(id: params[:id])
    end

    private

        def user_params
            params.require(:user).permit(:show_name, :name, :email, :password, :password_confirmation)
        end
end
