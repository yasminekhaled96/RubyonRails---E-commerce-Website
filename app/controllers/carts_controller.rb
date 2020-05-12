class CartsController < ApplicationController
    def index
      # @cart = Cart.new(:user_id =>current_user.id)
      # @cart.save
      # @cart.product_shoppings.create(:product_id => params[:product])
      # @carts=Cart.all
      @cart=Cart.find_by user_id: current_user.id
      if(!@cart)
        @cart=Cart.new(:user_id =>current_user.id)
        @cart.save
      end
      if params[:product]
        @product=Product.find(params[:product])
        if @product.instockquantity >0
          
             @cart.product_shoppings.create(:product_id => params[:product])
        end
      end
      
      @carts = Cart.where("user_id == ?" , current_user.id).order(:name).page(params[:page])
  
  
    end
  
  
    def destroy
     @cart = Cart.find_by user_id: current_user.id
     @cart = @cart.product_shoppings.find_by product_id: params[:product]
     @product= Product.find(params[:product])
     if @product.instockquantity
        if @product.instockquantity  >0
              @cart.destroy
        end
    end         
  
    end
  
  
    def show
      @cart =Cart.find_by user_id: current_user.id
      
    end
    
  end
  