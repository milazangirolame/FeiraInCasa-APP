class CartsController < ApplicationController

  def index
    @carts = Cart.all
  end

  def show
    @cart = Cart.find(params[:id])


  end

  def new

    @cart = Cart.new

  end

  def create
    @cart = Cart.new(cart_params)
    if @cart.save
      redirect_to @itens_path
    else
      render :new
    end
  end

  def edit

   @cart = Cart.find(params[:id])
   @itens = current_user.product.item.all


 end

 def update

  @cart = Cart.find(params[:id])
  if @cart.update(cart_params)
    redirect_to cart_path(@cart)
  else
    render :edit
  end
end

def destroy

  @cart = Cart.find(params[:id])
  @cart.destroy

end

private

def cart_params
  params.require(:cart).permit(:delivery_date, :delivery_zipcode, :delivery_address, :delivery_city, :payment_method)

end

end
