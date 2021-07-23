class InvoiceItem < ApplicationRecord
  belongs_to :invoice
  belongs_to :item
  # has_many :customers, through: :invoice
  # has_many :transactions, through: :invoice
  # has_many :merchants, through: :item
end
