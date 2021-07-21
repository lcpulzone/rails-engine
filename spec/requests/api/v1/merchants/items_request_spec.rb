require 'rails_helper'

RSpec.describe 'Merchant Items' do
  describe 'all items for a merchant' do
    it 'can show all items for a given merchant' do
      merchant2 = create(:merchant)
      items = create_list(:item, 25, merchant: merchant2)

      get api_v1_merchant_items_path("#{merchant2.id}")
      merchant = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(merchant[:data].first.keys.length).to eq(3)
      expect(merchant[:data].first[:attributes].keys.length).to eq(4)
      expect(merchant[:data].count).to eq(25)
    end
  end
end
