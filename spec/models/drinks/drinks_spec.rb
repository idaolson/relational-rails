require 'rails_helper'

describe Drink do
  describe 'association' do
    it {should belong_to :boba_shop}
  end
end