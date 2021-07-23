class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :items, through: :invoice_items

  def self.find_name(name)
    Merchant.where("name ILIKE ?" ,"%#{name}%").limit(1)
  end
end
