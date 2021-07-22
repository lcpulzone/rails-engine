class Merchant < ApplicationRecord
  has_many :items

  def self.find_name(name)
    Merchant.where("name ILIKE ?" ,"%#{name}%").limit(1)
  end
end
