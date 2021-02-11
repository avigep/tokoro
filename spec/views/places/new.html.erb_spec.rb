require 'rails_helper'

RSpec.describe "places/new", type: :view do
  let(:user) { FactoryBot.create :user }

  before(:each) do
    assign(:place, Place.new(
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

  it "renders new place form" do
    render

    assert_select "form[action=?][method=?]", places_path, "post" do

      assert_select "input[name=?]", "place[name]"

      assert_select "textarea[name=?]", "place[note]"

      assert_select "input[name=?]", "place[lat]"

      assert_select "input[name=?]", "place[lng]"
    end
  end
end
