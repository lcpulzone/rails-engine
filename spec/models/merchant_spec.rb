require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'relationships' do
    it { should have_many(:items) }
  end

  describe 'class methods' do
    xit 'can give a limit of merchants shown per page' do
      expect(Merchant.page_limit(20)).to eq(20)
    end
  end
end
