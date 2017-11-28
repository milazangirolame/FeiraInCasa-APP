class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @item = @product.item_for(current_user)
    if !@item
      @item = Item.new(quantity: 0)
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.store = current_user.store
    if @product.save
      redirect_to current_user.store
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    @product.store = current_user.store
  end

  def update
   @product = Product.find(params[:id])
     if @product.update(product_params)
      redirect_to current_user.store
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to current_user.store
  end

  private

  def product_params
    params.require(:product).permit(:name, :category, :price, :unity, photos: [])
  end

end
