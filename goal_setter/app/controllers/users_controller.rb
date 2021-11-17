class UsersController < ApplicationController 

    def index 
        render :index
    end

    def show
        @user = User.find(params[:id])
        redirect_to user_url(@user)
    end

    def new
        render :new
    end

    def create
        user = User.new(user_params)
        if user.save 
            #login#
            redirect_to user_url(user)
        else
            render :new 
        end
    end

    def edit
        @user = User.find(params[:id])
        redirect_to edit_user_url(@user)
    end

    def update

    end

    def destroy
        
    end

    private 

    def user_params
        params[:user].permit(:username, :password)
    end

end