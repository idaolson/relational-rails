require 'rails_helper'

RSpec.describe "welcome index" do
  it "displays links to restaurants, pastas, boba shops, and drinks" do
    visit "/"
    expect(has_link?("Boba Shops")).to eq(true)
    expect(has_link?("New Boba Shop")).to eq(true)
    expect(has_link?("Drinks")).to eq(true)
    expect(has_link?("Restaurants")).to eq(true)
    expect(has_link?("New Restaurants")).to eq(true)
    expect(has_link?("Pastas")).to eq(true)
  end
end
