require 'rails_helper'

RSpec.describe "places/index", type: :view do
  let(:user) { FactoryBot.create :user }

  before(:each) do
    assign(:places, [
      Place.create!(
        name: "MyText",
        note: "MyText",
        lat: "9.99",
        lng: "9.99",
        user: user
      ),
      Place.create!(
        name: "MyText",
        note: "MyText",
        lat: "9.99",
        lng: "9.99",
        user: user
      )
    ])
    login_as_user
    allow(view).to receive(:current_user).and_return(user)
    allow(view).to receive_messages(:will_paginate => nil)
  end

  it "renders a list of places" do
    render
    assert_select "ul>li>span.place_name", text: "Name: MyText".to_s, count: 2
    assert_select "ul>li>span.place_note", text: "Note: MyText".to_s, count: 2
  end
end
