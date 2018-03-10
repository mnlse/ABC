class DeviseSessionsController < Devise::SessionsController
  after_action :after_login, only: [:create]

  def after_login
    # city_last_known
    # country_last_known


    resource.last_sign_in_ip
  end

end
