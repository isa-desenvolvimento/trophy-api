require 'rails_helper'

RSpec.describe "CollectedCoin", type: :request do
  let(:collected_coin) {CollectedCoin.new}
  describe "GET /collected_coin/index" do
    context "when collected_coin exists" do
      it "returns status code 200" do 
        collected_coin = create(:collected_coin)
        collected_coin_attributes = atributes_for(:collected_coin)
        get "/collected_coin/index/#{collected_coin.id}"
        expect(response).to have_http_status(200)
      end
      it "returns the collected_coin" do
        collected_coin = create(:collected_coin)
        collected_coin_attributes = atributes_for(:collected_coin)
        get "/collected_coin/index/#{collected_coin.id}"
        json_response = JSON.parse(response.body)
        expect(response.data).to have_attributes(json.expect('created_at', 'updated_at')) 
      end
    end
    context "when does not collected_coin exists" do
      it "returns status code 404" do
        get "/collected_coin/index/0"
        expect(response).to have_http_status(404)
      end
      it "returns a not found message" do
        get "/collected_coin/index/0"
        expect(response.body).to match(/Couldn't find collected_coin/)
      end
    end
  end

  describe "PUT /collected_coin/update" do
    context "when collected_coin exists" do
      it "returns status code 200" do
        collected_coin = create(:collected_coin)
        collected_coin_attributes = atributes_for(:collected_coin)
        put "/collected_coin/#{collected_coin.id}", params: collected_coin_attributes
        expect(response).to have_http_status(200)
      end
      it "returns the collected_coin update" do
        collected_coin = create(:collected_coin)
        collected_coin_attributes = atributes_for(:collected_coin)
        put "/collected_coin/update/#{collected_coin.id}", params: collected_coin_attributes
        json_response = JSON.parse(response.body)
        expect(collected_coin.reload).to have_attributes(json_response.expect('created_at', 'updated_at')) 
      end
    end
    context "when does not collected_coin exists" do
      it "returns status code 404" do
        put "/collected_coin/1"
        expect(response).to have_http_status(404)
      end
      it "returns a not found message" do
        put "/collected_coin/1"
        expect(response.body).to match(/Couldn't find collected_coin/)
      end
    end
  end

  describe "DELETE /collected_coin/update" do
    context "when collected_coin exists" do
      it "returns status code 204" do
        collected_coin = create(:collected_coin)
        delete "/collected_coin/destroy/#{collected_coin.id}"
        expect(response).to have_http_status(204)
      end

      it "destroy the record" do 
        collected_coin = create(:collected_coin)
        delete "/collected_coin/destroy/#{collected_coin.id}"
        expect {collected_coin.reload}.to raise_error ActiveRecord::RecordNotFound
      end
    end
    context "when does not collected_coin exists" do
      it "returns status code 404" do
        delete "/collected_coin/destroy/0"
        expect(response).to have_http_status(404)
      end
      it "returns a not found message" do
        delete "/collected_coin/destroy/0"
        expect(response.body).to match(/Couldn't find collected_coin/)
      end
    end
  end
end
