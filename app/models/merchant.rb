class Merchant < ApplicationRecord
  has_many :items

  def self.page_limit(per_page)
    offset(@page * per_page).limit(per_page)
  end
end
