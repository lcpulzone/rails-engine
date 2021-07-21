require 'rails_helper'

RSpec.describe 'Items Request' do
  describe 'all items' do
    it 'can get all items' do
      merchant4 = create(:merchant)
      items3 = create_list(:item, 20, merchant: merchant4)

      get api_v1_items_path
      items = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(items[:data].count).to eq(20)
      expect(items[:data].class).to eq(Array)
      expect(items[:data].first[:attributes]).to have_key(:name)
      expect(items[:data].first[:attributes][:name]).to be_a(String)
    end

    it 'can get 20 items per page' do
      merchant4 = create(:merchant)
      items3 = create_list(:item, 50, merchant: merchant4)

      get api_v1_items_path(page:1)
      items = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(items[:data].count).to eq(20)
      expect(items[:data].first.length).to eq(3)
      expect(items[:data].first[:attributes].length).to eq(4)
      expect(items[:data].first[:attributes][:name].class).to eq(String)

      get api_v1_items_path(page:2)

      expect(response).to be_successful
      expect(items[:data].count).to eq(20)
      expect(items[:data].first.length).to eq(3)
      expect(items[:data].first[:attributes].length).to eq(4)
      expect(items[:data].first[:attributes][:name].class).to eq(String)
    end
  end

  describe 'one item' do
    it 'can get one item' do
      merchant5 = create(:merchant)
      item5 = create(:item, merchant: merchant5)

      get api_v1_item_path(item5.id)
      item = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(item.class).to eq(Hash)
      expect(item[:data][:type]).to eq("item")
      expect(item[:data][:attributes].count).to eq(4)
      expect(item[:data][:attributes][:name]).to eq("#{item5.name}")
    end
  end
end
