require 'rails_helper'

RSpec.describe "places/edit", type: :view do
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

  it "renders the edit place form" do
    render

    assert_select "form[action=?][method=?]", place_path(@place), "post" do

      assert_select "input[name=?]", "place[name]"

      assert_select "textarea[name=?]", "place[note]"

      assert_select "input[name=?]", "place[lat]"

      assert_select "input[name=?]", "place[lng]"
    end
  end
end
