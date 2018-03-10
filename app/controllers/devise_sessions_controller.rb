class DeviseSessionsController < Devise::SessionsController
  after_action :after_login, only: [:create]

  def after_login
    GeocodeIpAddressJob.perform_later(resource)
  end

end
