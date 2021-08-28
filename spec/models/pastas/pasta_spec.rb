require 'rails_helper'

RSpec.describe Pasta do
  describe 'association' do
    it {should belong_to :restaurant}
  end
end
