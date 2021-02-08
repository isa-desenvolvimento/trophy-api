require 'rails_helper'

RSpec.describe "Death", type: :request do
  let(:death) {Death.new}
  describe "GET /death/index" do
    context "when death exists" do
      it "returns status code 200" do 
        death = create(:death)
        death_attributes = atributes_for(:death)
        get "/death/index/#{death.id}"
        expect(response).to have_http_status(200)
      end
      it "returns the death" do
        death = create(:death)
        death_attributes = atributes_for(:death)
        get "/death/index/#{death.id}"
        json_response = JSON.parse(response.body)
        expect(response.data).to have_attributes(json.expect('created_at', 'updated_at')) 
      end
    end
    context "when does not death exists" do
      it "returns status code 404" do
        get "/death/index/0"
        expect(response).to have_http_status(404)
      end
      it "returns a not found message" do
        get "/death/index/0"
        expect(response.body).to match(/Couldn't find death/)
      end
    end
  end

  describe "PUT /death/update" do
    context "when death exists" do
      it "returns status code 200" do
        death = create(:death)
        death_attributes = atributes_for(:death)
        put "/death/#{death.id}", params: death_attributes
        expect(response).to have_http_status(200)
      end
      it "returns the death update" do
        death = create(:death)
        death_attributes = atributes_for(:death)
        put "/death/update/#{death.id}", params: death_attributes
        json_response = JSON.parse(response.body)
        expect(death.reload).to have_attributes(json_response.expect('created_at', 'updated_at')) 
      end
    end
    context "when does not death exists" do
      it "returns status code 404" do
        put "/death/1"
        expect(response).to have_http_status(404)
      end
      it "returns a not found message" do
        put "/death/1"
        expect(response.body).to match(/Couldn't find death/)
      end
    end
  end

  describe "DELETE /death/update" do
    context "when death exists" do
      it "returns status code 204" do
        death = create(:death)
        delete "/death/destroy/#{death.id}"
        expect(response).to have_http_status(204)
      end

      it "destroy the record" do 
        death = create(:death)
        delete "/death/destroy/#{death.id}"
        expect {death.reload}.to raise_error ActiveRecord::RecordNotFound
      end
    end
    context "when does not death exists" do
      it "returns status code 404" do
        delete "/death/destroy/0"
        expect(response).to have_http_status(404)
      end
      it "returns a not found message" do
        delete "/death/destroy/0"
        expect(response.body).to match(/Couldn't find death/)
      end
    end
  end
end
