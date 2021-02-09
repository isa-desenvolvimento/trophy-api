# spec/integration/monster_spec.rb
require 'swagger_helper'

describe 'Monster API' do

  path '/monster' do

    get 'Retrieves monsters' do
      tags 'Monster'
      produces 'application/json', 'application/xml'

      response '200', 'name found' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            name: { type: :string },
          },
          required: [ 'id', 'name' ]

        let(:id) { Monster.create(name: 'foo') }
        run_test!
      end

      response '404', 'monster not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/monster/{id}' do

    put 'Retrieves monsters' do
      tags 'Monster'
      consumes 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string
      parameter name: :name, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
        },
        required: [ 'name' ]
      }

      response '200', 'name found' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            name: { type: :string },
          },
          required: [ 'id', 'name' ]

        let(:id) { Monster.create(name: 'foo').id }
        run_test!
      end

      response '404', 'monster not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  

end