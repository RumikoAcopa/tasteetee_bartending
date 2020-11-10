class OrdersController < ApplicationController
    before_action :set_order, only: [:new, :show, :edit, :update, :destroy]

    #create a conditional if user they see they're orders.  
    #if admin they can see all

    #need to show quantity of drinks some how!
    def index 
        if params[:drink_id]
        @drink = Drink.find_by(id: params[:user_id])
            if @drink.nil?
                redirect_to drinks_path, alert: "Drink not found"
            else
                @drinks = @drink.orders
            end
        else
            @orders = Order.all
        end
    end 

    def new 
        @drinks = Drink.new(order_params)
        #@preference/Admin? = Preference.first
        #if @preference.allow_create_drinks
        #@order = Order.new
        #else
        #redirect_to orders_path
    end

    def show
        if params[:drink_id]
            @drink = Drink.find_by(id: params[:drink_id])
            @order = @drink.orders.find_by(id: params[:id])
                # if @drink.nil?
                    # # redirect_to drink_orders_path(@drink), alert: "Drink  not found"
                # end
        else
            @drink = Drink.find(params[:id])
        end 
    end 

    def create
        @order = Order.new(order_params)
        if @order.save
            redirect_to @order
        else
            render :new
        end 
    end

    def edit
        @order = Order.find(params[:id]) 
    end 

    def update
        @order = Order.find(params[:id]) 
        @order = Order.update(order_params)
        if Order.save
            redirect_to @order
        else
            render :edit
        end
    end 

    def destroy 
        @order = Order.find(params[:id])
        @order.destroy
        flash[:notice] = "Order deleted."
        redirect_to orders_path
    end 
end

private

def order_params
    params.require(:order).permit(:user_id, :drink_id, :quantity)
end 

def set_order 
    @order = Order.find_by(params[:id])
end

