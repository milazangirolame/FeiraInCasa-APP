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
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def store_params
    params.require(:store).permit(:name, :address, :city, :zipcode, :opened_time, :closed_time, :days_of_week_opened, :delivery_product, :maximum_distance_to_deliver_km)
  end

end
