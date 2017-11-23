class StoresController < ApplicationController
  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    @store.user = current_user
    if @store.save
      redirect_to @store
    else
      render:new
    end
  end

  def destroy
    @store = Store.find(store.user = current_user)
    @store.destroy
    redirect_to stores_path
  end

  def show
    @store = Store.find(params[:id])
    @user = @store.user

  end

  def edit
    @store = Store.find(params[:id])
    if @store.user != current_user
      redirect_to store_path(@store), alert: 'Você não pode editar esta loja!'
      return
    end
  end

  def update
    @store = Store.find(params[:id])
    if @store.update(store_params)
     redirect_to store_path(@store)
    else
     render :edit
    end
  end

  def index
    @stores = Store.all
  end

  private

  def store_params
    params.require(:store).permit(:name, :address, :city, :zipcode, :opened_time, :longitude, :latitude, :closed_time, :delivery_product, :maximum_distance_to_deliver_km, days_of_week_opened: [])
  end

end
