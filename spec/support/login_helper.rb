module LoginHelper
  def login_as_user
    sign_in FactoryBot.create(:user)
  end
end 

