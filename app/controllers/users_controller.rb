class UsersController < ApplicationController 
    before_action :authenticate_user!
    

    def show 
        @user = current_user.users.find(params[:id])
    end 

    

end 