# spec/integration/monster_spec.rb
require 'swagger_helper'

describe 'Death API' do
  path '/death' do
    get 'All deaths' do
      tags 'Death'
      produces 'application/json', 'application/xml'
      response '200', 'deaths found' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            time_reg: { type: :timestamp },
            user_id: { type: :integer },
          },
          required: [ 'id', 'value_coin', 'time_reg' ]

        let(:id) { Death.create(time_reg: Time.now, user_id: 1) }
        run_test!
      end

      response '404', 'deaths not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/death' do
    post 'Save death' do
      tags 'Death'
      consumes 'application/json', 'application/xml'
      parameter name: :death, in: :body, schema: {
        type: :object,
        properties: {
          time_reg: { type: :timestamp },
          user_id: { type: :integer },
        },
        required: [ 'time_reg', 'user_id' ]
      }
      
      response '201', 'death created' do
        let(:death) { { time_reg: Time.now, user_id: 1 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:death) { { time_reg: Time.now, user_id: 1 } }
        run_test!
      end
    end
  end

  path '/death/{id}' do
    delete 'Delete death' do
      tags 'Death'
      consumes 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :integer

      response '200', 'death deleted' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            time_reg: { type: :timestamp },
            user_id: { type: :integer }
          },
          required: [ 'id', 'time_reg', 'user_id' ]

        let(:id) { Death.create(time_reg: Time.now, user_id: 1).id }
        run_test!
      end

      response '404', 'death not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/death/{id}/sum_deaths' do
    get 'Sum deaths' do
      tags 'Death'
      consumes 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :integer

      response '200', 'death deleted' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            time_reg: { type: :timestamp },
            user_id: { type: :integer }
          },
          required: [ 'id', 'time_reg', 'user_id' ]

        let(:id) { Death.create(time_reg: Time.now, user_id: 1).id }
        run_test!
      end

      response '404', 'sum deaths not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

end