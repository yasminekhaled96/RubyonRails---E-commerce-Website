class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy ]
  load_and_authorize_resource

  # GET /products
  # GET /products.json
  def index

    @products = Product.search(params[:search]).all
    

    # @products = Product.all
    @categories = Category.all
    @brands = Brand.all

   
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
   
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    # @product.image.attach(params[:product][:image])
    @product.image.attach(params[:product][:image])
    @product.user_id = current_user.id

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product.image.attach(params[:product][:image])

    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  #Filter
  def filter
    if (params[:category].blank?) && (params[:brand].blank?) &&(params[:price].blank?) 
      @products = Product.all
    else
      @products = Product.filter(params)
      @categories = Category.all
      @brands = Brand.all
      @category_name = Category.find(params[:category]).name if params[:category].present?
      @brand_name = Brand.find(params[:brand]).name if params[:brand].present?
    
     
    end
  end


  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:title, :description, :price, :instockquantity, :category_id, :brand_id , :store_id )
    end

    # def filtering_params(params)
    #   params.slice(:category, :brand)
    # end

    
end
