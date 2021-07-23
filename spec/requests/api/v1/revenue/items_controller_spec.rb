require 'rails_helper'

RSpec.describe 'Items Revenue' do
  xit 'can find the top ten items' do
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

    get api_v1_revenue_items_path(quantity: 1)
    items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
  end
end
