require 'rails_helper'
# srequire 'factories/user_factory'


RSpec.describe "/user", type: :request do

  describe "GET /user" do 
    it 'returns status code 200' do

      user = FactoryBot.create(:user)
      user.password = Digest::SHA1.hexdigest user.password
      
      puts user.id
      puts user.name
      puts user.email
      puts user.password

      post "/user"
      expected(response).to be_successful

      # user = User.create! valid_attributes
      # get edit_user_url(user)
      # expect(response).to be_successful
    end
  end

end
