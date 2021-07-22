require 'rails_helper'

RSpec.describe 'Revenue Merchants' do
  describe 'merchants with the most revenue' do
    it 'can return the top 10 merchants' do
      create_list(:merchant, 20)

      get api_v1_revenue_merchants_path(quantity:10)
      merchant = JSON.parse(response.body, symbolize_names: true)

      expect(merchant[:data].count).to eq(10)
    end
  end
end
