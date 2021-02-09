# spec/integration/monster_spec.rb
require 'swagger_helper'

describe 'Trophy API' do
  path '/trophy/{id}/rank' do
    get 'Rank of user' do
      tags 'Trophy'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :integer
      
      response '200', 'rank found' do
        schema type: :object,
          properties: {
            sum_coins: { type: :integer, },
            sum_kill_by_monster: { 
              type: :object, properties: {
                "1": {type: :integer},
                "2": {type: :integer},
              }
            },
            sum_deaths: { type: :integer },
            rank_coins: { type: :string },
            rank_deaths: { type: :string },
            rank_kill_monster_1: { type: :string },
            rank_kill_monster_2: { type: :string }
          },
          required: [ ]

        let(:id) { User.create(name: 'Test', email: 'test@email.com') }
        run_test!
      end

      response '404', 'Rank not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end