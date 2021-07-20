class Merchant < ApplicationRecord
  has_many :items

  # def self.page_limit(page, per_page)
  #   Merchant.offset((page - 1) * per_page).limit(per_page))
  # end
end
