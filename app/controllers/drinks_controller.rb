class DrinksController < ApplicationController
    before_action :set_drink, only: [:show, :edit, :update, :destroy]
    #in order to show,edit,update& destroy movie you NEED TO FIND IT W/SET_DRINK
    def index
        @drinks = Drink.all
    end 

    def new #order a new drink or add drinkt to folder
        @drink = Drink.new
    end 

    def show #scope of particular user. They've Ordered?
        @drink = Drink.find(params[:id])
    end

    def create
        @drink = Drink.new(drink_params)
        if @drink.save
            redirect_to @drink
        else
            render :new
        end
    end 

    def edit
       @drink = Drink.find(params[:id])  
    end 

    def update 
        @drink = Drink.find(params[:id])  
        @drink = Drink.updat(drink_params)
        if @drink.save
            redirect_to @drink
        else
            render :edit
        end
    end

    def destroy
        @drink = Drink.find(params[:id])
        drink.destroy
        flash[:notice] = "Drink has been deleted!"
        redirect_to drinks_path
    end 

    private

    def drink_params 
        params.require(:drink).permit(:name, :ingredients, :price)
    end 

    #code to find set drink

    def set_drink 
        @drink = Drink.find(params[:id])
    end 


end
