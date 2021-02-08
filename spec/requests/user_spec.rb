require 'rails_helper'

RSpec.describe "User", type: :request do
  let(:user) {User.new}
  describe "GET /user/index" do
    context "when user exists" do
      it "returns status code 200" do 
        user = create(:user)
        user_attributes = atributes_for(:user)
        get "/user/index/#{user.id}"
        expect(response).to have_http_status(200)
      end
      it "returns the user" do
        user = create(:user)
        user_attributes = atributes_for(:user)
        get "/user/index/#{user.id}"
        json_response = JSON.parse(response.body)
        expect(response.data).to have_attributes(json.expect('created_at', 'updated_at')) 
      end
    end
    context "when does not user exists" do
      it "returns status code 404" do
        get "/user/index/0"
        expect(response).to have_http_status(404)
      end
      it "returns a not found message" do
        get "/user/index/0"
        expect(response.body).to match(/Couldn't find user/)
      end
    end
  end

  describe "PUT /user/update" do
    context "when user exists" do
      it "returns status code 200" do
        user = create(:user)
        user_attributes = atributes_for(:user)
        put "/user/#{user.id}", params: user_attributes
        expect(response).to have_http_status(200)
      end
      it "returns the user update" do
        user = create(:user)
        user_attributes = atributes_for(:user)
        put "/user/update/#{user.id}", params: user_attributes
        json_response = JSON.parse(response.body)
        expect(user.reload).to have_attributes(json_response.expect('created_at', 'updated_at')) 
      end
    end
    context "when does not user exists" do
      it "returns status code 404" do
        put "/user/1"
        expect(response).to have_http_status(404)
      end
      it "returns a not found message" do
        put "/user/1"
        expect(response.body).to match(/Couldn't find user/)
      end
    end
  end

  describe "DELETE /user/update" do
    context "when user exists" do
      it "returns status code 204" do
        user = create(:user)
        delete "/user/destroy/#{user.id}"
        expect(response).to have_http_status(204)
      end

      it "destroy the record" do 
        user = create(:user)
        delete "/user/destroy/#{user.id}"
        expect {user.reload}.to raise_error ActiveRecord::RecordNotFound
      end
    end
    context "when does not user exists" do
      it "returns status code 404" do
        delete "/user/destroy/0"
        expect(response).to have_http_status(404)
      end
      it "returns a not found message" do
        delete "/user/destroy/0"
        expect(response.body).to match(/Couldn't find user/)
      end
    end
  end
end
