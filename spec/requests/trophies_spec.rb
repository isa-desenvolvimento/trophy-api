require 'rails_helper'

RSpec.describe "Trophy", type: :request do
  let(:trophy) {Trophy.new}
  describe "GET /trophy/index" do
    context "when trophy exists" do
      it "returns status code 200" do 
        trophy = create(:trophy)
        trophy_attributes = atributes_for(:trophy)
        get "/trophy/index/#{trophy.id}"
        expect(response).to have_http_status(200)
      end
      it "returns the trophy" do
        trophy = create(:trophy)
        trophy_attributes = atributes_for(:trophy)
        get "/trophy/index/#{trophy.id}"
        json_response = JSON.parse(response.body)
        expect(response.data).to have_attributes(json.expect('created_at', 'updated_at')) 
      end
    end
    context "when does not trophy exists" do
      it "returns status code 404" do
        get "/trophy/index/0"
        expect(response).to have_http_status(404)
      end
      it "returns a not found message" do
        get "/trophy/index/0"
        expect(response.body).to match(/Couldn't find trophy/)
      end
    end
  end

  describe "PUT /trophy/update" do
    context "when trophy exists" do
      it "returns status code 200" do
        trophy = create(:trophy)
        trophy_attributes = atributes_for(:trophy)
        put "/trophy/#{trophy.id}", params: trophy_attributes
        expect(response).to have_http_status(200)
      end
      it "returns the trophy update" do
        trophy = create(:trophy)
        trophy_attributes = atributes_for(:trophy)
        put "/trophy/update/#{trophy.id}", params: trophy_attributes
        json_response = JSON.parse(response.body)
        expect(trophy.reload).to have_attributes(json_response.expect('created_at', 'updated_at')) 
      end
    end
    context "when does not trophy exists" do
      it "returns status code 404" do
        put "/trophy/1"
        expect(response).to have_http_status(404)
      end
      it "returns a not found message" do
        put "/trophy/1"
        expect(response.body).to match(/Couldn't find trophy/)
      end
    end
  end

  describe "DELETE /trophy/update" do
    context "when trophy exists" do
      it "returns status code 204" do
        trophy = create(:trophy)
        delete "/trophy/destroy/#{trophy.id}"
        expect(response).to have_http_status(204)
      end

      it "destroy the record" do 
        trophy = create(:trophy)
        delete "/trophy/destroy/#{trophy.id}"
        expect {trophy.reload}.to raise_error ActiveRecord::RecordNotFound
      end
    end
    context "when does not trophy exists" do
      it "returns status code 404" do
        delete "/trophy/destroy/0"
        expect(response).to have_http_status(404)
      end
      it "returns a not found message" do
        delete "/trophy/destroy/0"
        expect(response.body).to match(/Couldn't find trophy/)
      end
    end
  end
end
