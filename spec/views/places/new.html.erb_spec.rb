require 'rails_helper'

RSpec.describe "places/new", type: :view do
  before(:each) do
    assign(:place, Place.new(
      name: "MyText",
      note: "MyText",
      lat: "9.99",
      lng: "9.99",
      user: nil
    ))
  end

  it "renders new place form" do
    render

    assert_select "form[action=?][method=?]", places_path, "post" do

      assert_select "textarea[name=?]", "place[name]"

      assert_select "textarea[name=?]", "place[note]"

      assert_select "input[name=?]", "place[lat]"

      assert_select "input[name=?]", "place[lng]"

      assert_select "input[name=?]", "place[user_id]"
    end
  end
end
