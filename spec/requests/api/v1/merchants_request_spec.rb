require 'rails_helper'

RSpec.describe 'Get Merchants', type: :request do
  it 'can get all merchants' do
    #when adding about serialzier might need to adjust the test
    create_list(:merchant, 3)

    get '/api/v1/merchants'
    merchants = JSON.parse(response.body, symbolize_names: true)

# expect(response.status).to eq(200)
    expect(response).to be_successful
    expect(merchants[:data].count).to eq(3)
    expect(merchants[:data].class).to eq(Array)
    expect(merchants[:data].first[:attributes]).to have_key(:name)
    expect(merchants[:data].first[:attributes][:name]).to be_a(String)
    require "pry";binding.pry 
  end
end
