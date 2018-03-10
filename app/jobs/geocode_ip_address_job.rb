class GeocodeIpAddressJob < ApplicationJob
  queue_as :default

  def perform(resource)
    address = ::Geocoder.address(resource.last_sign_in_ip).split(", ")

    city = address[0]
    country = address[2]
    resource.city_last_known = city
    resource.country_last_known = country
    resource.save
  end
end
