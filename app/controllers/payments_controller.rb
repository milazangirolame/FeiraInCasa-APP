class PaymentsController < ApplicationController
  before_action :set_order

  def new

  end

  def create
  customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
  )

  charge = Stripe::Charge.create(
    customer:     customer.id,   # You should store this customer id and re-use it.
    amount:       @cart.amount_centavos,
    description:  "Pagamento feito com sucesso #{@cart.id}",
    currency:     @cart.amount.currency
  )
  @cart.update(payment: charge.to_json, state: 'paid')
  redirect_to stores_path


  rescue Stripe::CardError => e
  flash[:alert] = e.message
  redirect_to new_cart_payment_path(@cart)
  end

  def show
  @cart = Cart.find(params[:id]
end

private

  def set_cart
    @cart = Cart.where(state: 'pending').find(params[:cart_id])
  end
end
