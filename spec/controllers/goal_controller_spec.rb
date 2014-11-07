require 'rails_helper'

describe GoalsController do
  describe 'GET /goals' do
    it 'returns all goals' do
      FactoryGirl.create :goal, name: 'learn to code', circle: 'responsibility', quarter: '1'
      FactoryGirl.create :goal, name: 'date Danae.', circle: 'relational', quarter: '1'

      # FIX
      # get '/goals', {}, { "Accept" => "application/json" }

      get "index", {}, { "Accept" => "application/json" }
      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      goals = body.map { |g| g['name'] }
      expect(goals).to match_array(['learn to code', 'date Danae.'])
    end
  end

  describe 'GET /goals/:id' do
    it 'returns a request goal' do
      g = FactoryGirl.create :goal, name: 'swim 500 miles', circle: 'personal', quarter: '2'

      # FIX
      # get "show/#{g.id}", {}, { "Accept" => "application/json" }
      get :show, id: g.id
      expect(response.status).to eq 200
      body = JSON.parse(response.body).first
      expect(body["name"]).to eq 'swim 500 miles'
    end
  end

  describe 'POST /goals' do
    it 'creates a goal' do
      goal_params = {
        'goal' => {
          name: 'learn TDD',
          circle: 'responsibility',
          quarter: '1'
        }
      }

      # is this necessary? Tests pass...
      # request_headers = {
      #   "Accept" => "application/json",
      #   "Content-Type" => "application/json"
      # }

      post :create, goal_params #, request_headers
      expect(response.status).to eq 201
    end

    it 'returns error on bad request' do
      goal_params = {
        'goal' => {
          name: 'learn TDD',
          circle: 'personal'
        }
      }

      post :create, goal_params
      expect(response.status).to eq 422
    end
  end
end
