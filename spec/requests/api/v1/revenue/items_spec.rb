require 'rails_helper'

RSpec.describe 'Items Revenue' do
  it 'can find the top ten items' do
    merchant9 = create(:merchant)
    create_list(:item, 20, merchant: :merchant9)

    get api_v1_revenue_items_path(quantity: 10)
    items = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
  end
end
