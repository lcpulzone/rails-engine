class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices

  def self.items_by_revenue
    joins(invoice_items: {invoice: :transactions})
    .where("invoice.status='shipped' AND transactions.result='success'")
    .group("items.id")
    .select("items.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
    .order("revenue DESC")
    .limit(10)
  end
end
