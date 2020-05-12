class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]
  def index
        @products = Product.all
        @cart = @current_cart
  end
end
