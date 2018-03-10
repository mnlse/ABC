class DeviseSessionsController < Devise::SessionsController
  after_action :after_login, only: [:create]

  def after_login
    # city_last_known
    # country_last_known
    address = ::Geocoder.address(resource.last_sign_in_ip).split(", ")

    city = address[0]
    country = address[2]
    resource.city_last_known = city
    resource.country_last_known = country
    resource.save
  end

end
