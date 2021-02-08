# spec/integration/monster_spec.rb
require 'swagger_helper'

describe 'Collected Coin API' do
  path '/collected_coin' do
    get 'All coins' do
      tags 'Coins'
      produces 'application/json', 'application/xml'
      response '200', 'coin found' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            value_coin: { type: :integer },
            user_id: { type: :integer },
          },
          required: [ 'id', 'value_coin', 'user_id' ]

        let(:id) { CollectedCoin.create(value_coin: 1, user_id: 1) }
        run_test!
      end

      response '401', 'coin not saved' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/collected_coin' do
    post 'Save coin' do
      tags 'Coins'
      consumes 'application/json', 'application/xml'
      parameter name: :collected_coin, in: :body, schema: {
        type: :object,
        properties: {
          value_coin: { type: :integer },
          user_id: { type: :integer },
        },
        required: [ 'value_coin', 'user_id' ]
      }
      
      response '201', 'coin created' do
        let(:collected_coin) { { value_coin: 1, user_id: 1 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:collected_coin) { { value_coin: 1 } }
        run_test!
      end
    end
  end

  path '/collected_coin/{id}' do
    delete 'Delete coin' do
      tags 'Coins'
      consumes 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :integer

      response '200', 'coin deleted' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            value_coin: { type: :integer },
            user_id: { type: :integer }
          },
          required: [ 'id', 'value_coin', 'user_id' ]

        let(:id) { CollectedCoin.create(value_coin: 1, user_id: 1).id }
        run_test!
      end

      response '404', 'coin not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end