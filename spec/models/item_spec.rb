require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'relationships' do
    it { should belong_to(:merchant) }
    it { should have_many(:invoice_items) }
    it { should have_many(:invoices).through(:invoice_items) }
    it { should have_many(:customers).through(:invoices) }
    it { should have_many(:transactions).through(:invoices) }
  end

  describe 'class methods' do
    xit 'can get items by revenue' do
      merchant = create(:merchant)
      merchant2 = create(:merchant)

      customer = create(:customer)
      customer2 = create(:customer)

      items1 = create(:item, merchant: merchant)
      items2 = create(:item, merchant: merchant2)

      invoice = create(:invoice, merchant: merchant, customer: customer)
      invoice2 = create(:invoice, merchant: merchant2, customer: customer2)

      invoice_item = create(:invoice_item, item: items1, invoice: invoice)
      invoice_item2 = create(:invoice_item, item: items2, invoice: invoice2)

      transaction = create(:transaction, invoice: invoice)
      transaction2 = create(:transaction, invoice: invoice2)

      expect(Item.items_by_revenue(1).length).to eq(1)
      expect(Item.items_by_revenue(1)[0].class).to eq(Item)
    end
  end
end
