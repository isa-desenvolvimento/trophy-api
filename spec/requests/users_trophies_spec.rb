require 'rails_helper'

RSpec.describe "UsersTrophy", type: :request do
  let(:users_trophies) {UsersTrophy.new}
  describe "GET /users_trophies/index" do
    context "when users_trophies exists" do
      it "returns status code 200" do 
        users_trophies = create(:users_trophies)
        users_trophies_attributes = atributes_for(:users_trophies)
        get "/users_trophies/index/#{users_trophies.id}"
        expect(response).to have_http_status(200)
      end
      it "returns the users_trophies" do
        users_trophies = create(:users_trophies)
        users_trophies_attributes = atributes_for(:users_trophies)
        get "/users_trophies/index/#{users_trophies.id}"
        json_response = JSON.parse(response.body)
        expect(response.data).to have_attributes(json.expect('created_at', 'updated_at')) 
      end
    end
    context "when does not users_trophies exists" do
      it "returns status code 404" do
        get "/users_trophies/index/0"
        expect(response).to have_http_status(404)
      end
      it "returns a not found message" do
        get "/users_trophies/index/0"
        expect(response.body).to match(/Couldn't find users_trophies/)
      end
    end
  end

  describe "PUT /users_trophies/update" do
    context "when users_trophies exists" do
      it "returns status code 200" do
        users_trophies = create(:users_trophies)
        users_trophies_attributes = atributes_for(:users_trophies)
        put "/users_trophies/#{users_trophies.id}", params: users_trophies_attributes
        expect(response).to have_http_status(200)
      end
      it "returns the users_trophies update" do
        users_trophies = create(:users_trophies)
        users_trophies_attributes = atributes_for(:users_trophies)
        put "/users_trophies/update/#{users_trophies.id}", params: users_trophies_attributes
        json_response = JSON.parse(response.body)
        expect(users_trophies.reload).to have_attributes(json_response.expect('created_at', 'updated_at')) 
      end
    end
    context "when does not users_trophies exists" do
      it "returns status code 404" do
        put "/users_trophies/1"
        expect(response).to have_http_status(404)
      end
      it "returns a not found message" do
        put "/users_trophies/1"
        expect(response.body).to match(/Couldn't find users_trophies/)
      end
    end
  end

  describe "DELETE /users_trophies/update" do
    context "when users_trophies exists" do
      it "returns status code 204" do
        users_trophies = create(:users_trophies)
        delete "/users_trophies/destroy/#{users_trophies.id}"
        expect(response).to have_http_status(204)
      end

      it "destroy the record" do 
        users_trophies = create(:users_trophies)
        delete "/users_trophies/destroy/#{users_trophies.id}"
        expect {users_trophies.reload}.to raise_error ActiveRecord::RecordNotFound
      end
    end
    context "when does not users_trophies exists" do
      it "returns status code 404" do
        delete "/users_trophies/destroy/0"
        expect(response).to have_http_status(404)
      end
      it "returns a not found message" do
        delete "/users_trophies/destroy/0"
        expect(response.body).to match(/Couldn't find users_trophies/)
      end
    end
  end
end
