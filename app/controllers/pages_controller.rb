class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @stores = Store.where.not(latitude: nil, longitude: nil)
    @markers = Gmaps4rails.build_markers(@stores) do |store, marker|
      marker.lat store.latitude
      marker.lng store.longitude
      marker.infowindow render_to_string(partial: "/shared/card_store_map", locals: { store: store })
    end
  end

end
