class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

 
  # GET /orders
  # GET /orders.json
  def index

    @user = User.all
    @orders = Order.where(user_id: current_user.id)
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order= Order.find(params[:id])
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
    @order= Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create 
    @user = User.all
    @user_id=current_user.id
    # @order= Order.find(params[:id])
    @order = Order.new(user_id: @user_id, orderstate: "pending")
    add_line_items_to_order
    @order.save!
    reset_sessions_cart
    # @order = Order.new(order_params)
    # @current_cart.line_items.each do |item|
    #   @order.line_items << item
    #   item.cart_id = nil
    # end

    # @order.orderstate = "pending"
    # @order.user_id = 1 #current_user_id
    # @order.user_id = current_user.id
    # @order.save
    # Cart.destroy(session[:cart_id])
    # session[:cart_id] = nil

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    @order = Order.find(params[:id])
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.

    def add_line_items_to_order
      @current_cart.line_items.each do |item|
        item.cart_id = nil
        item.order_id = @order.id
        item.save
        @order.line_items << item
      end
    end
  
    def reset_sessions_cart
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
    end

    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:orderstate, :user_id)
  
    end
end
