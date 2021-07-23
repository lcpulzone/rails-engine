class Item < ApplicationRecord
  belongs_to :merchant
  # has_many :invoice_items
  # has_many :invoices, through: :invoice_items
  # has_many :transactions, through: :invoices
  # has_many :customers, through: :invoices

  def self.items_by_revenue(number)
    joins(invoice_items: {invoice: :transactions})
    .where("invoices.status='shipped' AND transactions.result='success'")
    .select("items.*, sum(invoice_items.quantity * invoice_items.unit_price) as total_revenue")
    .group("items.id")
    .order("total_revenue DESC")
    .limit(number)
  end
end
