class Category < ApplicationRecord
  has_many :advertisements
  def to_s
    name
  end
end
