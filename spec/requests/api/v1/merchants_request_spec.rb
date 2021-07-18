require 'rails_helper'

RSpec.describe 'Get Merchants', type: :request do
  it 'can get all merchants' do
    create_list(:merchant, 3)

    get api_v1_merchants_path
    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(merchants[:data].count).to eq(3)
    expect(merchants[:data].class).to eq(Array)
    expect(merchants[:data].first[:attributes]).to have_key(:name)
    expect(merchants[:data].first[:attributes][:name]).to be_a(String)
  end

  it 'can get 20 merchants per page' do
    create_list(:merchant, 40)

    get '/api/v1/merchants?page=1'
    # get api_v1_merchants?page=1_path LOOK UP HOW TO DO THIS
    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(merchants[:data].count).to eq(20)

    get '/api/v1/merchants?page=2'

    expect(merchants[:data].count).to eq(20)
  end
end
