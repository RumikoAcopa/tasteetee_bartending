class AdminsController < ApplicationController 

    def index 
    end 

    def new 
        if params[:user_id] && !User.exists?(params[:user_id])
            redirect_to users_path, alert: "User not found."
        else
            @order = Order.new(user_id: params[:user_id])
        end
    end 
end