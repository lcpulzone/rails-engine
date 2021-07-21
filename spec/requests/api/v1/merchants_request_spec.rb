require 'rails_helper'

RSpec.describe 'Merchants Request', type: :request do
  describe 'all merchants' do
    it 'can get all merchants' do
      create_list(:merchant, 20)

      get api_v1_merchants_path
      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(merchants[:data].count).to eq(20)
      expect(merchants[:data].class).to eq(Array)
      expect(merchants[:data].first[:attributes]).to have_key(:name)
      expect(merchants[:data].first[:attributes][:name]).to be_a(String)
    end

    it 'can get 20 merchants per page' do
      create_list(:merchant, 40)

      get api_v1_merchants_path(page:1)
      merchants = JSON.parse(response.body, symbolize_names: true)

      expect(merchants[:data].count).to eq(20)

      get api_v1_merchants_path(page:2)

      expect(merchants[:data].count).to eq(20)
    end
  end

  describe 'one merchant' do
    it 'can get one merchant' do
      merchant1 = create(:merchant)

      get api_v1_merchant_path(merchant1.id)
      merchant = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(merchant.class).to eq(Hash)
      expect(merchant[:data][:type]).to eq("merchant")
      expect(merchant[:data][:attributes].count).to eq(1)
      expect(merchant[:data][:attributes][:name]).to eq("#{merchant1.name}")
    end
  end
end
