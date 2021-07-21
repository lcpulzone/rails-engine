require 'rails_helper'

RSpec.describe 'Items Merchant' do
  it 'can get the merchant data for a given item' do
    merchant3 = create(:merchant)
    item2 = create(:item, merchant: merchant3)

    get api_v1_item_merchant_path("#{item2.id}")
    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(merchant[:data].keys.length).to eq(3)
    expect(merchant[:data][:attributes].keys.length).to eq(1)
    expect(merchant[:data][:type].class).to eq(String)
    expect(merchant[:data][:attributes][:name]).to eq(merchant3.name)
  end
end
