module ApplicationHelper
  class GuestUser
    attr_reader :email, :city_last_known
    def initialize(ip:, email:)
      @email = email
      @city_last_known = ::Geocoder.address(ip)
    end
  end

  def current_user
    super || GuestUser.new(email: "guest@guest.com", ip: request.remote_ip)
  end
end
