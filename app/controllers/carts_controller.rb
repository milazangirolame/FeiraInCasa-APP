class CartsController < ApplicationController

  def index
    @carts = Cart.joins(items: { product: :store })
              .where("stores.user_id" => current_user).uniq
    @store = current_user.store
    @user = @store.user
  end

  def show
    @cart = Cart.find(params[:id])
    @items = @cart.items

    @show_pay_button = current_user == @cart.user &&
                       @cart.products.count.positive? &&
                       ( !@cart.products.first.store.delivery_product ||
                         @cart.products.first.store.delivery_product &&
                         @cart.delivery_address.present?)

  end

  def new
    @cart = Cart.new
  end

  def create
    @cart = Cart.new(cart_params)
    @cart.user = current_user
    if @cart.save
      redirect_to @items_path
    else
      render :new
    end
  end

  def edit
   @cart = Cart.find(params[:id])
   @items = current_user.product.item.all
 end

 def update

  @cart = Cart.find(params[:id])
  if @cart.update(cart_params)
    flash[:notice] = "Endereço alterado com sucesso!"
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
  params.require(:cart).permit(:items, :amount, :state, :user, :delivery_date, :delivery_zipcode, :delivery_address, :delivery_city, :payment_method)

end

end
