require 'rails_helper'

RSpec.describe "places/show", type: :view do
  let(:user) { FactoryBot.create :user }

  before(:each) do
    @place = assign(:place, Place.create!(
      name: "MyText",
      note: "MyText",
      lat: "9.99",
      lng: "9.99",
      user: user
    ))
    login_as_user
    allow(view).to receive(:current_user).and_return(user)
    allow(view).to receive_messages(:will_paginate => nil)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
  end
end
