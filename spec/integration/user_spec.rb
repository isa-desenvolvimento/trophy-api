# spec/integration/monster_spec.rb
require 'swagger_helper'

describe 'User API' do
  path '/user' do
    get 'All users' do
      tags 'User'
      produces 'application/json', 'application/xml'
      response '200', 'users found' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            name: { type: :string },
            email: { type: :string }
          },
          required: [ 'id', 'name', 'email' ]

        let(:id) { User.create(name: 'Test', email: 'test@email.com') }
        run_test!
      end

      response '404', 'users not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/signup' do
    post 'Save user' do
      tags 'User'
      consumes 'application/json', 'application/xml'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object, properties: {
              name: { type: :string },
              email: { type: :string },
              password: { type: :string },
            }         
          }
        },          
        required: [ 'name', 'email', 'password' ]
      }
      
      response '200', 'user created' do
        let(:death) { { name: 'Test', email: 'test@email.com' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:death) { { name: 'Test', email: 'test@email.com' } }
        run_test!
      end
    end
  end

  path '/user/{id}' do
    delete 'Delete user' do
      tags 'User'
      consumes 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :integer

      response '200', 'user deleted' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            name: { type: :string },
            email: { type: :string },
            password: { type: :string }
          },
          required: [ 'id', 'name', 'email' ]

        let(:id) { User.create(name: 'Test', email: 'test@email.com', password: 'test123').id }
        run_test!
      end

      response '404', 'user not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end