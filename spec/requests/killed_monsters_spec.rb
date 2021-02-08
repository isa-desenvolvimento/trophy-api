require 'rails_helper'

RSpec.describe "KilledMonster", type: :request do
  let(:killed_monsters) {KilledMonster.new}
  describe "GET /killed_monsters/index" do
    context "when killed_monsters exists" do
      it "returns status code 200" do 
        killed_monsters = create(:killed_monsters)
        killed_monsters_attributes = atributes_for(:killed_monsters)
        get "/killed_monsters/index/#{killed_monsters.id}"
        expect(response).to have_http_status(200)
      end
      it "returns the killed_monsters" do
        killed_monsters = create(:killed_monsters)
        killed_monsters_attributes = atributes_for(:killed_monsters)
        get "/killed_monsters/index/#{killed_monsters.id}"
        json_response = JSON.parse(response.body)
        expect(response.data).to have_attributes(json.expect('created_at', 'updated_at')) 
      end
    end
    context "when does not killed_monsters exists" do
      it "returns status code 404" do
        get "/killed_monsters/index/0"
        expect(response).to have_http_status(404)
      end
      it "returns a not found message" do
        get "/killed_monsters/index/0"
        expect(response.body).to match(/Couldn't find killed_monsters/)
      end
    end
  end

  describe "PUT /killed_monsters/update" do
    context "when killed_monsters exists" do
      it "returns status code 200" do
        killed_monsters = create(:killed_monsters)
        killed_monsters_attributes = atributes_for(:killed_monsters)
        put "/killed_monsters/#{killed_monsters.id}", params: killed_monsters_attributes
        expect(response).to have_http_status(200)
      end
      it "returns the killed_monsters update" do
        killed_monsters = create(:killed_monsters)
        killed_monsters_attributes = atributes_for(:killed_monsters)
        put "/killed_monsters/update/#{killed_monsters.id}", params: killed_monsters_attributes
        json_response = JSON.parse(response.body)
        expect(killed_monsters.reload).to have_attributes(json_response.expect('created_at', 'updated_at')) 
      end
    end
    context "when does not killed_monsters exists" do
      it "returns status code 404" do
        put "/killed_monsters/1"
        expect(response).to have_http_status(404)
      end
      it "returns a not found message" do
        put "/killed_monsters/1"
        expect(response.body).to match(/Couldn't find killed_monsters/)
      end
    end
  end

  describe "DELETE /killed_monsters/update" do
    context "when killed_monsters exists" do
      it "returns status code 204" do
        killed_monsters = create(:killed_monsters)
        delete "/killed_monsters/destroy/#{killed_monsters.id}"
        expect(response).to have_http_status(204)
      end

      it "destroy the record" do 
        killed_monsters = create(:killed_monsters)
        delete "/killed_monsters/destroy/#{killed_monsters.id}"
        expect {killed_monsters.reload}.to raise_error ActiveRecord::RecordNotFound
      end
    end
    context "when does not killed_monsters exists" do
      it "returns status code 404" do
        delete "/killed_monsters/destroy/0"
        expect(response).to have_http_status(404)
      end
      it "returns a not found message" do
        delete "/killed_monsters/destroy/0"
        expect(response.body).to match(/Couldn't find killed_monsters/)
      end
    end
  end
end
