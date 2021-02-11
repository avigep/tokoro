require 'rails_helper'

RSpec.describe "/places", type: :request do
  # Place. As you add validations to Place, be sure to
  # adjust the attributes here as well.
  let(:user) { FactoryBot.create :user }

  let(:valid_attributes) {
    {
      "name"=>"private - updated",
      "note"=>"private note",
      "lat"=>"12",
      "lng"=>"12",
      "user_id"=> user.id
    }
  }

  before do
    ENV['GOOGLE_MAPS_API_KEY'] = 'test-key'
  end

  describe "GET /index" do
    context "all users" do
      it "renders a successful response" do
        get members_url
        expect(response).to be_successful
      end
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      place = Place.create! valid_attributes
      get member_url(user)
      expect(response).to be_successful
    end
  end

end
  