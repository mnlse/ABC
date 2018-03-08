class Advertisement < ApplicationRecord
  def self.recent
    where("created_at > ?", Time.now - 24.hours).limit(9)
  end
end
