require 'rails_helper'

RSpec.describe "Monster", type: :request do
  let(:monster) {Monster.new}
  describe "GET /monster/index" do
    context "when monster exists" do
      it "returns status code 200" do 
        monster = create(:monster)
        monster_attributes = atributes_for(:monster)
        get "/monster/index/#{monster.id}"
        expect(response).to have_http_status(200)
      end
      it "returns the monster" do
        monster = create(:monster)
        monster_attributes = atributes_for(:monster)
        get "/monster/index/#{monster.id}"
        json_response = JSON.parse(response.body)
        expect(response.data).to have_attributes(json.expect('created_at', 'updated_at')) 
      end
    end
    context "when does not monster exists" do
      it "returns status code 404" do
        get "/monster/index/0"
        expect(response).to have_http_status(404)
      end
      it "returns a not found message" do
        get "/monster/index/0"
        expect(response.body).to match(/Couldn't find monster/)
      end
    end
  end

  describe "PUT /monster/update" do
    context "when monster exists" do
      it "returns status code 200" do
        monster = create(:monster)
        monster_attributes = atributes_for(:monster)
        put "/monster/#{monster.id}", params: monster_attributes
        expect(response).to have_http_status(200)
      end
      it "returns the monster update" do
        monster = create(:monster)
        monster_attributes = atributes_for(:monster)
        put "/monster/update/#{monster.id}", params: monster_attributes
        json_response = JSON.parse(response.body)
        expect(monster.reload).to have_attributes(json_response.expect('created_at', 'updated_at')) 
      end
    end
    context "when does not monster exists" do
      it "returns status code 404" do
        put "/monster/1"
        expect(response).to have_http_status(404)
      end
      it "returns a not found message" do
        put "/monster/1"
        expect(response.body).to match(/Couldn't find monster/)
      end
    end
  end

  describe "DELETE /monster/update" do
    context "when monster exists" do
      it "returns status code 204" do
        monster = create(:monster)
        delete "/monster/destroy/#{monster.id}"
        expect(response).to have_http_status(204)
      end

      it "destroy the record" do 
        monster = create(:monster)
        delete "/monster/destroy/#{monster.id}"
        expect {monster.reload}.to raise_error ActiveRecord::RecordNotFound
      end
    end
    context "when does not monster exists" do
      it "returns status code 404" do
        delete "/monster/destroy/0"
        expect(response).to have_http_status(404)
      end
      it "returns a not found message" do
        delete "/monster/destroy/0"
        expect(response.body).to match(/Couldn't find monster/)
      end
    end
  end
end
