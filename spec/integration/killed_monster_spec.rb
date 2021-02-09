# spec/integration/monster_spec.rb
require 'swagger_helper'

describe 'Monster API' do

  path '/killed_monster' do
    get 'Retrieves killed monsters' do
      tags 'Killed Monster'
      produces 'application/json', 'application/xml'

      response '200', 'killed monsters founded' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            user_id: { type: :integer },
            monster_id: { type: :integer }
          },
          required: [ 'id', 'user_id', 'monster_id' ]

        let(:id) { KilledMonster.create(user_id: 1, monster_id: 1) }
        run_test!
      end

      response '404', 'killed monsters not founded' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/killed_monster/{id}' do
    delete 'Delete killed monster' do
      tags 'Killed Monster'
      consumes 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :integer

      response '200', 'killed monster deleted' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            user_id: { type: :integer },
            monster_id: { type: :integer }
          },
          required: [ 'id', 'monster_id', 'user_id' ]

        let(:id) { KilledMonster.create(monster_id: 1, user_id: 1).id }
        run_test!
      end

      response '404', 'killed monster not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end


  path '/killed_monster' do
    post 'Save killed monster' do
      tags 'Killed Monster'
      consumes 'application/json', 'application/xml'
      parameter name: :killed_monster, in: :body, schema: {
        type: :object,
        properties: {
          user_id: { type: :integer },
          monster_id: { type: :integer }
        },
        required: [ 'id', 'monster_id', 'user_id' ]
      }
      
      response '201', 'killed monster created' do
        let(:killed_monster) { { monster_id: 1, user_id: 1 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:killed_monster) { { monster_id: 1, user_id: 1 } }
        run_test!
      end
    end
  end


  path '/killed_monster/{id}/sum_monsters' do

    get 'Sum monsters' do
      tags 'Killed Monster'
      consumes 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string
      
      response '200', 'name found' do
        schema type: :object,
          properties: {
            status: { type: :string, },
            message: { type: :string },
            data: { 
              type: :object, properties: {
                "1": { type: :integer },
                "2": { type: :integer },
              } 
            }
          }
        let(:id) { KilledMonster.create(monster_id: 1, user_id: 1).id }
        run_test!
      end

      response '404', 'sum monsters not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

end